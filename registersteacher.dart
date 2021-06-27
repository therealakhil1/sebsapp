import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/login.dart';
class registersteacher extends StatefulWidget {
  @override
  registersteacherState createState() => new registersteacherState();
}

class registersteacherState extends State<registersteacher>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SEBS",
          style:GoogleFonts.rozhaOne(),
          //TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed:(){
                          Navigator.push(
                              context,MaterialPageRoute(builder: (context) => login())
                          );
                        },
                        child: Text("Return to login")
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 371,
                    height: 470,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("Assets/images/registereds.jpg")
                      )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:75.0,left: 47.0),
                      child: Text(
                          "Yay you have been registered",
                          style: GoogleFonts.tenaliRamakrishna(fontSize: 26),
                      ),
                    )
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:127.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed:(){
                      //sends you to teacher profile update page
                    },
                    child: Text(
                      "Update profile",
                       style: GoogleFonts.rozhaOne(),
                    )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}