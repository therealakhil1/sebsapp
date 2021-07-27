

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseService{
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  final CollectionReference attendance=FirebaseFirestore.instance.collection('attendance');
  final CollectionReference student=FirebaseFirestore.instance.collection('student');
  final CollectionReference alumini=FirebaseFirestore.instance.collection('alumini');
  final FirebaseAuth _auth=FirebaseAuth.instance;
  //DatabaseService({required this.uid});
  //to update data(also on new user registration)
  Future updateUserData(String role,String name,String subjectteaching,String gradeteaching,String village,String educationalqualification)async{
    final String uid=FirebaseAuth.instance.currentUser!.uid;
    return users.doc(uid).set(
     {
       "role":role,
       "name":name,
       "subjectteaching":subjectteaching,
       "gradeteaching":gradeteaching,
       "village":village,
       "educationalqualification":educationalqualification
     }
    );
  }
  Future getRole() async{
    final String uid=FirebaseAuth.instance.currentUser!.uid;
    return users.doc(uid).get();
  }
  Future takeAttendance(String uniqueid,bool present) async{
    String date=dateformatted();
    print(date);
    return attendance.doc().set(
        {
              "uniqueid":uniqueid,
              "present":present,
              "date":date,

        }
    );
  }
  Future createStudentprofile(String name,String uniqueid,String village,String grade,bool alumini,bool financialaidrequired) async{
    return student.doc(uniqueid).set(
        {
          "name":name,
          "uniqueid":uniqueid,
          "village":village,
          "grade":grade,
          "alumini":alumini,
          "financialaidrequired":financialaidrequired
        }
    );
  }
  Future createAluminiprofile(String name,String financialaidrequired) async {
    return alumini.doc(name).set(
        {
          "name": name,
          "financialaidrequired": financialaidrequired
        }
    );
  }
  // Future displayStudentprofile(String uniqueid) async{
  //    String name="";
  //    String village="";
  //    String grade="";
  //     return student.doc(uniqueid).get().then((value) => {
  //      name=value["name"],
  //      village=value["village"],
  //      grade=value["grade"],
  //      // print(name),
  //      // print(village),
  //      // print(grade),
  //      // Text(name),
  //      // Text(village),
  //      // Text(grade)
  //   }
  //   );
  // }
    Future profileData() async{
    final String uid=FirebaseAuth.instance.currentUser!.uid;
    return users.doc(uid).get();
  }
  Future generateStudentList() async{
    dynamic results;
    await student.get().then((QuerySnapshot querySnapshot) {
      results=querySnapshot.docs;
    });
    return results;
  }
  Future showAttendance(dynamic daet) async{
    dynamic results;
    // await attendance.get().then((QuerySnapshot querySnapshot) {
    //   results=querySnapshot.docs;
    // });
    print("yeetus");
    print(daet);
    await attendance.where("date",isEqualTo: daet).orderBy("uniqueid").get().then((QuerySnapshot querySnapshot) {
      results=querySnapshot.docs;
    });
    return results;
  }
  String dateformatted(){
    String date=DateTime.now().toString();
    dynamic dateParse = DateTime.parse(date);
    dynamic formattedDate = "${dateParse.day}${dateParse.month}${dateParse.year}";
    String finaldate=formattedDate.toString();
    return finaldate;
  }
}