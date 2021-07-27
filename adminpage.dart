import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/createstudentprofile.dart';
import 'package:flutter_app/register.dart';
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
class adminpage extends StatefulWidget {
  @override
  adminpageState createState() => new adminpageState();
}

class adminpageState extends State<adminpage> {
  final Authenticate _auth =Authenticate();
  List<Carouseldata> carousel=[
    new Carouseldata("Assets/images/student.jpg", "view student profile",viewstudentprofile()),
    new Carouseldata("Assets/images/aluminiprofile.jpg", "create alumini profile",createaluminiprofile()),
    new Carouseldata("Assets/images/attandance.jpg", "view alumini profile",viewaluminiprofile()), //change image
    new Carouseldata("Assets/images/attandance.jpg", "view attendance",viewattendance()),
    new Carouseldata("Assets/images/attandance.jpg", "register a teacher or admin",register())//change image
  ];
  @override
  Widget build(BuildContext context){
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
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
                                  child:GestureDetector(
                                      child: Container(
                                          alignment: Alignment.center,
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
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(onPressed:()async{
                        await _auth.signout();
                      },
                          child: Text("Sign out")
                      ),
                    )
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}
