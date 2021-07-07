import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
class viewstudentprofile extends StatefulWidget {
  @override
  viewstudentprofileState createState() => new viewstudentprofileState();
}

class viewstudentprofileState extends State<viewstudentprofile> {
  int show=0;
  final _formKey= GlobalKey<FormState>();
  TextEditingController _uniqueid =TextEditingController();
  final CollectionReference student=FirebaseFirestore.instance.collection('student');
  String name="";
  String village="";
  String grade="";
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
        body:Center(
          child:Column(
              children:[
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        hintText:'Enter the students unique id'
                                    ),
                                    controller: _uniqueid,
                                    validator: (val) =>val!.isEmpty ? 'This is a required field' : null
                                )
                            )
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){
                print("press");
                student.doc(_uniqueid.text).get().then((value) => {

                  this.setState(()=> {
                    name="Name:"+value["name"],
                    village="Village:"+value["village"],
                    grade="Grade:"+value["grade"],
                  }),
                }
                );
              },
                  child: Text("View profile")
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(name,
                      style: GoogleFonts.rozhaOne(
                          color: Colors.black,
                          fontSize: 35
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(village,
                        style: GoogleFonts.rozhaOne(
                            color: Colors.black,
                            fontSize: 35)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(grade,
                        style: GoogleFonts.rozhaOne(
                            color: Colors.black,
                            fontSize: 35)
                    ),
                  )
                ]
              ),
              ]
          )
      )
    );
  }
}