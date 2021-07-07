import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
import 'package:flutter_app/attendancelistbuilder.dart';
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
              // Navigator.push(
              //   context,MaterialPageRoute(builder: (context) => login()),//techerprofileupdate()
              // );
              print("logis");
            },
          )
        ],
      backgroundColor: Colors.black45,
    ),
      body: Center(
          // child:FutureBuilder(
          //     future: db.getRole(),
          //     builder: (context,snapshot){
          //       if(snapshot.connectionState==ConnectionState.done){
          //         if(snapshot.hasData){
          //           dynamic vari=snapshot.data;
          //           if(vari["role"]=='teacher')
          //           {
          //             return teacherpage();
          //           }
          //           else{
          //             return login();//adminhomepage()
          //           }
          //         }
          //
          //       }
          //       return HomePage();
          //     }
          // )
        child: ElevatedButton(
          child: Text("build list"),
          onPressed: (){
            //db.haha();
            Navigator.push(
              context,MaterialPageRoute(builder: (context) => attendancelistbuilder()),//decide the destination file name later
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