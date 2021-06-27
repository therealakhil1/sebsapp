import 'package:flutter/material.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
class authwrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final user =Provider.of<User?>(context);
    print(user);
    return HomePage();
  }
}