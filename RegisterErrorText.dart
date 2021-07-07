import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/registersadmin.dart';
import 'package:flutter_app/registersteacher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/flutterfire.dart';
class RegisterErrorText extends StatefulWidget {
  @override
  RegisterErrorTextState createState() => new RegisterErrorTextState();
}

class RegisterErrorTextState extends State<RegisterErrorText> {
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Column(
          children: [
            Text("Enter email bruh"),
            ElevatedButton(onPressed:(){
              Navigator.pop(
                  context,MaterialPageRoute(builder: (context) => RegisterErrorText())
              );
            } ,
                child: Text("Go back to register"))
          ],
        ),
      )
    );
  }

}