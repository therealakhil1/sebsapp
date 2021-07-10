import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';

class createaluminiprofile extends StatefulWidget {
  @override
  createaluminiprofileState createState() => new createaluminiprofileState();
}

class createaluminiprofileState extends State<createaluminiprofile> {
  final _formKey= GlobalKey<FormState>();
  TextEditingController _name =TextEditingController();
  TextEditingController _uniqueid =TextEditingController();
  TextEditingController _village=TextEditingController();
  TextEditingController _grade =TextEditingController();
  String error="";
  String dropdownValue="Required";
  final db = DatabaseService();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SEBS",
          style:GoogleFonts.rozhaOne(),
        ),
        actions:[
          TextButton(
            child: Container(
              child:Icon(
                  Icons.account_circle_rounded
              ),
            ),
            onPressed:(){
              // Navigator.push(
              //   context,MaterialPageRoute(builder: (context) => login()),//techerprofileupdate()
              // );
              print("logis");
            },
          )
        ],
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left:105.0,right: 10.0,top: 10.0,bottom: 10.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Text("Create alumini profile",
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
                      padding: const EdgeInsets.only(left:30.0,right: 10.0,top: 10.0,bottom: 10.0),
                      child: Row(
                          children:[
                            Container(
                              //width: MediaQuery.of(context).size.width * 0.6,
                                width:350,
                                child:TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText:'name'
                                    ),
                                    controller: _name,
                                    validator: (val) =>val!.isEmpty ? ' Enter a name' : null
                                )
                            )
                          ]
                      ),
                    ),


                    // Padding(
                    //   padding: const EdgeInsets.only(left:30.0,right: 10.0,top: 10.0,bottom: 10.0),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //           width:350,
                    //           child:TextFormField(
                    //               decoration: InputDecoration(
                    //                   border: OutlineInputBorder(),
                    //                   hintText:'uniqueid'
                    //               ),
                    //               controller: _uniqueid,
                    //               validator: (val) =>val!.isEmpty ? 'this field is required' : null
                    //           )
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left:30.0,right: 10.0,top: 10.0,bottom: 10.0),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //           width:350,
                    //           child:TextFormField(
                    //               decoration: InputDecoration(
                    //                   border: OutlineInputBorder(),
                    //                   hintText:'village'
                    //               ),
                    //               controller: _village,
                    //               validator: (val) =>val!.isEmpty ? 'this field is required' : null
                    //           )
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left:30.0,right: 10.0,top: 10.0,bottom: 10.0),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //           width:350,
                    //           child:TextFormField(
                    //               decoration: InputDecoration(
                    //                   border: OutlineInputBorder(),
                    //                   hintText:'grade'
                    //               ),
                    //               controller: _grade,
                    //               validator: (val) =>val!.isEmpty ? 'this field is required' : null
                    //           )
                    //       )
                    //     ],
                    //   ),
                    // )
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
                                items: <String>['Required', 'Not Required'].map<DropdownMenuItem<String>>((String value) {
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
                            db.createAluminiprofile(_name.text,dropdownValue);
                            Navigator.pop(
                              //registersteacher for now in the future take it to the page its supposed to go into
                                context,MaterialPageRoute(builder: (context) => createaluminiprofile())
                            );
                          }//validation
                        },//async method


                            child: Text("Create profile")
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
              //talk to koushik and see if alumini flag is really required here
            ],
          ),
        ),
      ),
    );
  }
}
