import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'database.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_app/profile.dart';
class viewattendancelistbuild extends StatefulWidget {
  String daet;
  viewattendancelistbuild(this.daet);
  @override
  viewattendancelistbuildState createState() => new viewattendancelistbuildState();
}

class viewattendancelistbuildState extends State<viewattendancelistbuild> {
  final db = DatabaseService();
  String pres="";
  @override
  Widget build(BuildContext context){
    print(widget.daet);
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
                context,MaterialPageRoute(builder: (context) => profile()),
              );
              print("logis");
            },
          )
        ],
        backgroundColor: Colors.black45,
      ),
    body: Center(
      child: Container(
        child: FutureBuilder(
          future:db.showAttendance(widget.daet) ,
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              if(snapshot.hasData){
                dynamic variant=snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount:variant.length ,
                  itemBuilder: (BuildContext context, int index) {
                    if(variant[index]["present"]==true){
                      pres="present";
                    }
                    else{
                      pres="absent";
                    }
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text(variant[index]["uniqueid"]),
                            Text(":"),
                            Text(pres)
                          ]
                        ),
                      ],
                    );
                  },
                );
              }
              else{
                return Container(
                  child: Text("Take attendance before you view it"),
                );
              }
            }
            else{
              return Container();
            }
          },
        ),
      ),
    )
    );
  }
}