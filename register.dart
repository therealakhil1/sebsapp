import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/registersadmin.dart';
import 'package:flutter_app/registersteacher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/flutterfire.dart';
import 'package:flutter_app/RegisterErrorText.dart';
class register extends StatefulWidget {
  @override
  registerState createState() => new registerState();
}

class registerState extends State<register> {
  String dropdownValue="Teacher";
  String value="Teacher";
  int d=1;
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  TextEditingController _confirmpassword=TextEditingController();
  final Authenticate _auth =Authenticate();
  final _formKey= GlobalKey<FormState>();
  int emailconfirm=0;
  int passwordconfirm=0;
  int confirmpasswordconfirm=0;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SEBS",
          style:GoogleFonts.rozhaOne(),
          //TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.black45,
      ),
      body:Center(
        child:Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Padding(
                padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
                child: Row(
                   children: [
                     Container(
                         width: 350,
                       child: TextFormField(
                          decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:'Your email id goes here'
                       ),
                         controller: _email,
                         validator: (val) =>val!.isEmpty ? ' Enter an email' : null
                     )
                     )
                   ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
                child: Row(
                  children: [
                    Container(
                        width: 350,
                      child: TextFormField(
                          decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:'Your password goes here'
                      ),
                        controller: _password,
                          obscureText: true,
                          validator: (val) => val!.isEmpty ? 'Enter a password 6+ characters long' : null
                    )
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 350,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:'Confirm password',
                        ),
                          controller: _confirmpassword,
                          obscureText: true,
                          validator: (val) => val!.length < 6 ? 'Enter a password 6+ characters long' : null
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left:165.0,bottom: 10.0),
                child: Row(
                  children: [
                    Container(
                      child:DropdownButton<String>(
                        value: dropdownValue,
                       onChanged: (String? newValue){
                          setState(() {
                            dropdownValue=newValue!;
                          });
                       },
                        items: <String>['Teacher', 'Admin'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }

                        ).toList(),
                      )
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,left:170.0,bottom: 10.0),
                child: Row(
                 children: [
                   dropdownValue=="Teacher"?Container(
                     child:ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         shape: CircleBorder(),
                         padding: EdgeInsets.all(10.0)
                       ),
                       child: Icon(
                         Icons.arrow_forward_ios
                       ),
                       onPressed: ()async{
                         if(_formKey.currentState!.validate()) {
                                 bool passwordMatch = await _auth.confirm(
                                     _password.text, _confirmpassword.text);
                                 if (passwordMatch == true) {
                                   dynamic shouldNavigate = await _auth.registers(
                                       _email.text, _password.text,dropdownValue);
                                   if (shouldNavigate != null) {
                                     Navigator.push(
                                         context, MaterialPageRoute(
                                         builder: (context) => registersteacher()
                                       )
                                     );
                                     print("Register successful teacher");
                                   }
                                 }
                               }



                       },
                     )


                   ):
                   Container(
                       child:ElevatedButton(
                         style: ElevatedButton.styleFrom(
                             shape: CircleBorder(),
                             padding: EdgeInsets.all(10.0)
                         ),
                         child: Icon(
                             Icons.arrow_forward_ios
                         ),
                         onPressed: ()async{
                           bool passwordMatch= await _auth.confirm(_password.text,_confirmpassword.text);
                           if(passwordMatch==true){
                             dynamic shouldNavigate=  await _auth.registers(_email.text,_password.text,dropdownValue);
                             if(shouldNavigate!=null){
                               Navigator.push(
                                   context,MaterialPageRoute(builder: (context) => registersadmin())
                               );
                             }
                           }
                           else{
                             child:Text("Passwords dont match try again");
                           }
                           print("Register successful admin");
                         },//onPressed
                       )
                   )
                 ],
                ),
              )
            ]
          ),
        )
      )
    );
  }
}