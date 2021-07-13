import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/register.dart';
import 'package:flutter_app/teacherpage.dart';
import 'package:flutter_app/flutterfire.dart';
import 'package:flutter_app/registersteacher.dart';

import 'authwrapper.dart';
class login extends StatefulWidget {
  @override
  loginState createState() => new loginState();
}

class loginState extends State<login> {
  void login()
  {
   //check role in the school and lead them to that page

  }
  final _formKey= GlobalKey<FormState>();
  final Authenticate _auth =Authenticate();
  TextEditingController _email =TextEditingController();
  TextEditingController _password =TextEditingController();
  String error="";
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            "SEBS",
            style:GoogleFonts.rozhaOne(),
        ),
          backgroundColor: Colors.black45,
        ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("SIGN IN",
                      style: GoogleFonts.rubik(
                        fontSize: 20
                      ),
                      )
                    )
                  ]
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children:[
                          Container(
                            //width: MediaQuery.of(context).size.width * 0.6,
                            width:350,
                            child:TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:'Email'
                              ),
                              controller: _email,
                                validator: (val) =>val!.isEmpty ? ' Enter an email' : null
                            )
                          )
                        ]
                      ),
                    ),


                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                          width:350,
                        child:TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText:'Password'
                          ),
                          controller: _password,
                          obscureText: true,
                            validator: (val) =>val!.isEmpty ? ' Enter a password' : null
                        )
                      )
                    ],
                  ),
                )
                  ],//children
                ),
              ),
              Padding(
                child: SizedBox(
                  width: 300,
                  child: Row(
                    children: [
                      ElevatedButton(onPressed:() async{
                        if(_formKey.currentState!.validate()){
                          dynamic signin = await _auth.signin(_email.text,_password.text);
                          if(signin!=null){
                            this.login();
                            Navigator.push(
                                context,MaterialPageRoute(builder: (context) => authwrapper())
                            );
                          }
                          else{
                            setState((){
                              error="Incorrect username or password";
                            });
                          }
                        }//validation
                        },//async method


                          child: Text("Login")
                      ),
                      Text(
                          error,
                        style: TextStyle(color: Colors.red,fontSize: 15),
                      )
                    ],
                  ),
                ),
                  padding: const EdgeInsets.only(top:10.0,bottom:10,left:150)
              )
            ],
          ),
        )
      )
    );
  }
}