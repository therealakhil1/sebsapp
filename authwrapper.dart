import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';
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
      // StreamBuilder(
      //   stream:FirebaseFirestore.instance.collection('users').snapshots() ,
      //   builder: (context,snapshot){
      //
      //   },
      // );
        //dynamic userdoc=users.doc(uid).get();
        //String role=userdoc.role;
        //print(userdoc);
//        Map<String,dynamic> data=snapshot.data!.data() as Map<String,dynamic>;

    }
    return FutureBuilder(
      future: db.getRole(),
      builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.done){
          if(snapshot.hasData){
            dynamic vari=snapshot.data;
            if(vari["role"]=='teacher')
            {
              return teacherpage();
              //return profile();
            }
            else{
              return teacherpage();//adminhomepage()
            }
          }

        }
        return HomePage();
      }
    );
    //print(role);
   // print(user);

    if(user!=null)
      {
         return teacherpage();

      }
    else{
      return HomePage();
    }

  }
}