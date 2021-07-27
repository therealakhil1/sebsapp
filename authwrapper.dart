import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/adminpage.dart';
import 'package:flutter_app/database.dart';
import 'package:flutter_app/profile.dart';
import 'package:flutter_app/teacherpage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class authwrapper extends StatefulWidget {
  @override
  _authwrapperState createState() => _authwrapperState();
}

class _authwrapperState extends State<authwrapper> {
  //String role="";
  @override
  Widget build(BuildContext context){
    final user =Provider.of<User?>(context);
    final CollectionReference users = FirebaseFirestore.instance.collection('users');
    final db = DatabaseService();
    if(user!=null){
      String uid=user.uid;
    }
    return FutureBuilder(
      future: db.getRole(),
      builder: (context,snapshot){
        print(snapshot.data);
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasData){
            dynamic vari=snapshot.data;
            if(vari["role"]=='teacher')
            {
              return teacherpage();
              //return profile();
            }
            else{
              return adminpage();
            }
          }

        }
        return HomePage();
      }
    );
  }
}