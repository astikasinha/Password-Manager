import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';

class splashscreen extends StatefulWidget{
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage(),));

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color:Colors.blue,
          child: Center(child: Text('Password Manager',style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),),
        )

    );
  }
}
