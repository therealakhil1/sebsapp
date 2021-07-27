import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'database.dart';
class profile extends StatefulWidget {
  @override
  profileState createState() => new profileState();
}

class profileState extends State<profile> {
  TextEditingController _name=TextEditingController();
  TextEditingController _subjectTeaching =TextEditingController();
  TextEditingController _gradeTeaching=TextEditingController();
  TextEditingController _village =TextEditingController();
  TextEditingController _educationalQualification =TextEditingController();
  String role="";
  final db = DatabaseService();
  final _formKey= GlobalKey<FormState>();
  dynamic vari;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SEBS",
          style:GoogleFonts.rozhaOne(),
          //TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.black45,
      ),
        body:Center(
        //   child:Form(
        //     key: _formKey,
        //      child: Column(
        //          mainAxisAlignment: MainAxisAlignment.center,
        //          children:[
        //            Padding(
        //              padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
        //              child: Row(
        //                children: [
        //                  Container(
        //                      width: 350,
        //                      child: TextFormField(
        //                          decoration: InputDecoration(
        //                              border: OutlineInputBorder(),
        //                              //hintText:'Your email id goes here'
        //                          ),
        //                          controller: _name,
        //                          validator: (val) =>val!.isEmpty ? ' Enter an email' : null
        //                      )
        //                  )
        //                ],
        //              ),
        //            ),
        //          ]
        //      )
        //   )
        //       //use futurebuilder
        // )
          child:FutureBuilder(
            future: db.profileData(),
            builder:(context,snapshot){
              if(snapshot.hasData){
                vari=snapshot.data;
                _name.text=vari["name"];
                _subjectTeaching.text=vari["subjectteaching"];
                _gradeTeaching.text=vari["gradeteaching"].toString();
                _village.text=vari["village"];
                _educationalQualification.text=vari["educationalqualification"];
                role=vari["role"];
                return Column(
                  children:[
                    Form(
                        key: _formKey,
                         child: Column(
                           children:[
                             Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children:[
                                   Padding(
                                     padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
                                     child: Row(
                                       children: [
                                         Container(
                                             width: 350,
                                             child: TextFormField(
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(),
                                                   //hintText:'Your email id goes here'
                                                 ),
                                                 controller: _name,
                                                 validator: (val) =>val!.isEmpty ? ' Enter an email' : null
                                             )
                                         )
                                       ],
                                     ),
                                   ),
                                 ]
                             ),
                             Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children:[
                                   Padding(
                                     padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
                                     child: Row(
                                       children: [
                                         Container(
                                             width: 350,
                                             child: TextFormField(
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(),
                                                   //hintText:'Your email id goes here'
                                                 ),
                                                 controller: _subjectTeaching,
                                                 validator: (val) =>val!.isEmpty ? ' Enter an email' : null
                                             )
                                         )
                                       ],
                                     ),
                                   ),
                                 ]
                             ),
                             Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children:[
                                   Padding(
                                     padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
                                     child: Row(
                                       children: [
                                         Container(
                                             width: 350,
                                             child: TextFormField(
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(),
                                                   //hintText:'Your email id goes here'
                                                 ),
                                                 controller: _gradeTeaching,
                                                 validator: (val) =>val!.isEmpty ? ' Enter an email' : null
                                             )
                                         )
                                       ],
                                     ),
                                   ),
                                 ]
                             ),
                             Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children:[
                                   Padding(
                                     padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
                                     child: Row(
                                       children: [
                                         Container(
                                             width: 350,
                                             child: TextFormField(
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(),
                                                   //hintText:'Your email id goes here'
                                                 ),
                                                 controller: _village,
                                                 validator: (val) =>val!.isEmpty ? ' Enter an email' : null
                                             )
                                         )
                                       ],
                                     ),
                                   ),
                                 ]
                             ),
                             Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children:[
                                   Padding(
                                     padding: const EdgeInsets.only(top:10.0,left:32.0,bottom: 10.0),
                                     child: Row(
                                       children: [
                                         Container(
                                             width: 350,
                                             child: TextFormField(
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(),
                                                   //hintText:'Your email id goes here'
                                                 ),
                                                 controller: _educationalQualification,
                                                 validator: (val) =>val!.isEmpty ? ' Enter an email' : null
                                             )
                                         )
                                       ],
                                     ),
                                   ),
                                 ]
                             ),
                           ]
                         )
                     ),
                    ElevatedButton(onPressed:(){
                        if(_formKey.currentState!.validate()){
                           db.updateUserData(role, _name.text, _subjectTeaching.text, _gradeTeaching.text, _village.text, _educationalQualification.text);
                        }
                        Navigator.pop(
                          context,MaterialPageRoute(builder: (context) => profile()),//decide the destination file name later
                        );
                    },
                    child: Text("Update"))
                  ]
                );
              }
              else{
                return Container(
                  child: Text("no hahah"),
                );
              }
            }
          )
        )
    );
  }
}