import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
import 'package:flutter_app/attendancelistbuilder.dart';
import 'package:flutter_app/profile.dart';
class attendance extends StatefulWidget {
  @override
  attendanceState createState() => new attendanceState();
}

class attendanceState extends State<attendance> {
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
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => profile()),//techerprofileupdate()
              );
              print("logis");
            },
          )
        ],
      backgroundColor: Colors.black45,
    ),
      body: Center(
        child: ElevatedButton(
          child: Text("Take attendance"),
          onPressed: (){
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => attendancelistbuilder()),
            );
            //attendancelistbuilder
            print("kjhgfdsa");
            //generate a page with students and a checkmark
          },
        ),
      ),
    );
  }
}