import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/createstudentprofile.dart';
import 'package:flutter_app/viewaluminiprofile.dart';
import 'package:flutter_app/viewstudentprofile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/flutterfire.dart';
import 'package:flutter_app/Carouseldata.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/attendance.dart';
import 'package:flutter_app/profile.dart';
import 'package:flutter_app/viewattendance.dart';

import 'createaluminiprofile.dart';
class teacherpage extends StatefulWidget {
  @override
  teacherpageState createState() => new teacherpageState();
}

class teacherpageState extends State<teacherpage> {
  @override
  Widget build(BuildContext context){
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    final Authenticate _auth =Authenticate();
    List<Carouseldata> carousel=[
      new Carouseldata("Assets/images/attandance.jpg", "ATTENDANCE",attendance()),
      new Carouseldata("Assets/images/student.jpg", "Create student profile",createstudentprofile()),
      new Carouseldata("Assets/images/student.jpg", "view student profile",viewstudentprofile()),
      new Carouseldata("Assets/images/aluminiprofile.jpg", "create alumini profile",createaluminiprofile()),
      new Carouseldata("Assets/images/attandance.jpg", "view alumini profile",viewaluminiprofile()), //change image
      new Carouseldata("Assets/images/attandance.jpg", "view attendace",viewattendance()),//change image
    ];
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
              print("teacher update");
            },
          )
        ],
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:70.0,bottom: 10.0,left: 10.0,right: 10.0),
                    child: CarouselSlider(
                      options: CarouselOptions(height: screenHeight-400),
                      items: carousel.map((index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),
                                //child: Text('text $index', style: TextStyle(fontSize: 16.0),)
                                child:GestureDetector(
                                    child: Container(
                                        alignment: Alignment.center,
                                        //child:AssetImage("Assets/images/attandance.jpg"),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                          image: DecorationImage(
                                            image: AssetImage(index.imagePath),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Text(
                                            index.text,
                                            style:GoogleFonts.tenaliRamakrishna(
                                                color: Colors.white,
                                                fontSize: 35
                                            )
                                        )
                                    ),
                                    onTap:() {
                                      Navigator.push(
                                          context,MaterialPageRoute(builder: (context) => index.navigator)
                                      );
                                    }
                                )
                            );
                            // return GestureDetector(
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(20.0),
                            //     child: Container(
                            //       width: 300.0,
                            //       alignment: Alignment.center,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            //         // image: DecorationImage(
                            //         //   image: AssetImage("${_images[index]}"),
                            //         //   fit: BoxFit.cover,
                            //         // ),
                            //       ),
                            //       child: Text(
                            //           "${_text[index]}",
                            //           style:GoogleFonts.tenaliRamakrishna(
                            //               color: Colors.white,
                            //               fontSize: 35
                            //           )
                            //       ),
                            //     ),
                            //   ),
                            //   onTap:(){
                            //     // Navigator.push(
                            //     //   context,MaterialPageRoute(builder: (context) => login()),//decide the destination file name later
                            //     // );
                            //     print("test");
                            //   },
                            // );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  // TinderSwapCard(
                  //   allowVerticalMovement: false,
                  //   //total number of card 5 for testing purposes only
                  //   totalNum: _images.length,
                  //   stackNum: 3,
                  //   maxHeight: screenHeight*0.7,
                  //   maxWidth: screenWidth*0.9,
                  //   minHeight: screenHeight*0.65,
                  //   minWidth: screenWidth*0.8,
                  //   cardBuilder: (context,index){
                  //     return Card(
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //             margin: EdgeInsets.all(10.0),
                  //
                  //             child: GestureDetector(
                  //               // child: Container(
                  //               //   decoration: BoxDecoration(
                  //               //     image: DecorationImage(
                  //               //
                  //               //       image: AssetImage("Assets/images/Schools_background_1.jpg"),
                  //               //       fit:BoxFit.cover
                  //               //     )
                  //               //   ),
                  //               // ),
                  //               child: Container(
                  //                 height:230.0,
                  //                 width: 300.0,
                  //                 alignment: Alignment.center,
                  //                 decoration: BoxDecoration(
                  //                   //borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  //                   image: DecorationImage(
                  //                     //insert actual image later on
                  //                     image: AssetImage('Assets/images/${_images[index]}'),
                  //                     fit: BoxFit.cover,
                  //                   ),
                  //                 ),
                  //                 child: Text(
                  //                     "${_text[index]}",
                  //                     style:GoogleFonts.tenaliRamakrishna(
                  //                         color: Colors.white,
                  //                         fontSize: 35
                  //                     )
                  //                 ),
                  //               ),
                  //               onTap:(){
                  //                 // Navigator.push(
                  //                 //   context,MaterialPageRoute(builder: (context) => attendance()),//decide the destination file name later
                  //                 // );
                  //                 print("attendance");
                  //               },
                  //             ),
                  //
                  //             ),
                  //
                  //         ],
                  //       ),
                  //     );
                  //   },
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(onPressed:()async{
                      await _auth.signout();
                    },
                        child: Text("Sign out")
                    ),
                  )
                ],
                //height: screenHeight-200,

              ),
            ),
          ]
        ),
      ),
    );
  }
}