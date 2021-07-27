import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/register.dart';
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
@override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "SEBS",
          style:GoogleFonts.rozhaOne(),
          //TextStyle(color: Colors.white),
        ),
        actions:[
          TextButton(
            child: Text(
              "Login",
              style: GoogleFonts.tenaliRamakrishna(
                color: Colors.white,
                fontSize: 17
              )
            ),
            onPressed:(){
              Navigator.push(
                context,MaterialPageRoute(builder: (context) => login()),//decide the destination file name later
              );
              print("logis");
            },
          )
        ],

        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          //backgroundColor: Colors.black45,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child:Text("register"),
              onPressed: (){
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => register()),//decide the destination file name later
                );
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height:230.0,
                  width: 300.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    image: DecorationImage(
                      image: AssetImage("Assets/images/Schools_background_1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                      "Schools",
                      style:GoogleFonts.tenaliRamakrishna(
                        color: Colors.white,
                        fontSize: 35
                      )
                  ),
                ),
              ),
              onTap:(){
                // Navigator.push(
                //   context,MaterialPageRoute(builder: (context) => login()),//decide the destination file name later
                // );
                print("test");
              },
            ),
            GestureDetector(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height:230.0,
                  width:300.0,
                  alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                        image: AssetImage("Assets/images/Videos_background_1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                        "Videos",
                            style:GoogleFonts.tenaliRamakrishna(
                              color: Colors.white,
                              fontSize: 35
                            ),

                    )
                ),
              ),
              onTap: (){
                print("test1");
              },
            )
          ],
        ),
      ),
    );
 }
}