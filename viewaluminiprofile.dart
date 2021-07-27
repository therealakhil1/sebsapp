import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
class viewaluminiprofile extends StatefulWidget {
  @override
  viewaluminiprofileState createState() => new viewaluminiprofileState();
}

class viewaluminiprofileState extends State<viewaluminiprofile> {
  int show=0;
  final _formKey= GlobalKey<FormState>();
  TextEditingController _name =TextEditingController();
  final CollectionReference alumini=FirebaseFirestore.instance.collection('alumini');
  String name="";
  String village="";
  String grade="";
  String financialaidrequired="";
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
                                            hintText:"Enter the alumini's name"
                                        ),
                                        controller: _name,
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
                    alumini.doc(_name.text).get().then((value) => {

                      this.setState(()=> {
                        name="Name:"+value["name"],
                        financialaidrequired="financial aid:"+value["financialaidrequired"],
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
                          child: Text(financialaidrequired,
                              style: GoogleFonts.rozhaOne(
                                  color: Colors.black,
                                  fontSize: 35)
                          ),
                        ),
                      ]
                  ),
                ]
            )
        )
    );
  }
}