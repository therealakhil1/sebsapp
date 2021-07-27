import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/authwrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/flutterfire.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //CustomUser val=<CustomUser>Authenticate().user;

    return StreamProvider<User?>.value(
      initialData: null,
      //value: <CustomUser?> != null?Authenticate().user,
      value:Authenticate().user,
      //value: Authenticate().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        // home: HomePage()
        home: authwrapper(),
      ),
    );
  }
}




