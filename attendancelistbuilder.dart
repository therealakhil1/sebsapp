

import 'package:flutter/material.dart';
import 'database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class attendancelistbuilder extends StatefulWidget {
  @override
  attendancelistbuilderState createState() => new attendancelistbuilderState();
}

class attendancelistbuilderState extends State<attendancelistbuilder> {
  final db=DatabaseService();
  bool isChecked=false;
  dynamic vari="";
  dynamic yeet;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: db.generateStudentList(),
              builder:(context,snapshot){
                // if(snapshot.connectionState==ConnectionState.done){
                //             //   print("sheeesh");
                //             // }
                //print(snapshot.data);
                if(snapshot.connectionState==ConnectionState.done){
                  if(snapshot.hasData){
                    print("data yes");
                    dynamic variant=snapshot.data;
                    //print(variant.length);
                    //dynamic doc=variant.map((data)=>_buildListItem(context,data)).toList();

                    //print(doc);
                    // return Column(
                    //   children: [
                    //     Row(
                    //       children: [
                    //         //Text(snapshot.data as String),
                    //         Checkbox(value: isChecked, onChanged: (bool? value){
                    //           setState(() {
                    //             isChecked=value!;
                    //           });
                    //         })
                    //       ],
                    //     ),
                    //     ElevatedButton(onPressed: (){
                    //       db.takeAttendance(snapshot.data as int, isChecked);
                    //     },
                    //     child: Text("Take attendance"))
                    //   ],
                    // );
                    return ListView.builder(
                        itemCount: variant.length,
                        itemBuilder: (context,index){
                          // return ListTile(
                          //   title: Text('${variant[index]["uniqueid"]}'),
                          //   //title: Text("hello"),
                          // );
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text('${variant[index]["uniqueid"]}'),
                                  Checkbox(value: isChecked, onChanged: (bool? value){
                                    setState(() {
                                      isChecked=value!;
                                    });
                                  })
                                ],
                              ),
                              ElevatedButton(onPressed:(){
                                //db.takeAttendance(uniqueid, isChecked)
                                print("yesssir");
                              },
                                  child: Text("Take attendance"))
                            ],

                          );
                        });
                  }
                  else{
                    return Container(
                      child: Text("no students to show"),
                    );
                  }
                }
                else{
                  return Container();//nothing
                }
              },
            ),
            // ElevatedButton(onPressed:(){
            //   //db.takeAttendance(uniqueid, isChecked)
            //   print("yesssir");
            // },
            // child: Text("Take attendance"))
          ],

        ),
      ),
    );
  }
}