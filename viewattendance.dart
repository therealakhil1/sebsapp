import 'package:flutter/material.dart';
import 'package:flutter_app/viewattendancelistbuild.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_app/profile.dart';
class viewattendance extends StatefulWidget {
  @override
  viewattendanceState createState() => new viewattendanceState();
}

class viewattendanceState extends State<viewattendance> {
  final db = DatabaseService();
  dynamic daet;
  String pres="";
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
        child: Container(
          child: TextButton(onPressed: () {
            DatePicker.showDatePicker(context,showTitleActions:true,minTime:DateTime(2021,7,5),maxTime:DateTime(2031,7,5),
            onConfirm: (date){
              setState(() {
                String deta=date.toString();
                dynamic dateParse = DateTime.parse(deta);
                dynamic formattedDate = "${dateParse.day}${dateParse.month}${dateParse.year}";
                String finaldate=formattedDate.toString();
                daet=finaldate;
                //print(daet);
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => viewattendancelistbuild(daet)),
                );
              });
            },
              currentTime: DateTime.now(),
              locale: LocaleType.en
            );

          },
          child: Text("Pick the day you want to see attendance for")),
        ),
      ),
    );
  }
}