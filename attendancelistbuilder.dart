import 'package:flutter/material.dart';
import 'database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class attendancelistbuilder extends StatefulWidget {
  @override
  attendancelistbuilderState createState() => new attendancelistbuilderState();
}

class attendancelistbuilderState extends State<attendancelistbuilder> {
  final db=DatabaseService();
  dynamic isChecked;
  dynamic vari="";
  dynamic yeet;
  dynamic variant;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: db.generateStudentList(),
              builder:(context,snapshot){
                if(snapshot.connectionState==ConnectionState.done){
                  if(snapshot.hasData){
                    print("data yes");
                    variant=snapshot.data;
                    if(isChecked==null){
                      isChecked=new List<bool>.filled(variant.length,false, growable:true);
                    }
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: variant.length,
                        itemBuilder: (context,index){
                          print(isChecked);
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text('${variant[index]["name"]}'),
                                  Checkbox(value: isChecked[index], onChanged: (bool? value){
                                    setState(() {
                                      isChecked[index]=value!;
                                      print("value1");
                                    });
                                    db.takeAttendance(variant[index]["uniqueid"], value!);
                                  })
                                ],
                              ),
                            ],
                          );
                          return Container();//nothing
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
            ElevatedButton(
              child:Text("Done") ,
              onPressed: (){
                int i=0;
                for(i=0;i<variant.length;i++){
                  if(isChecked[i]==false){
                    db.takeAttendance(variant[i]["uniqueid"], false);
                  }
                }
                Navigator.pop(
                  //registersteacher for now in the future take it to the page its supposed to go into
                    context,MaterialPageRoute(builder: (context) => attendancelistbuilder())
                );
              },
            )
          ],

        ),
      ),
    );
  }
}