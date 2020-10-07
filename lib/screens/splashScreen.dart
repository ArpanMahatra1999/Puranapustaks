import 'dart:async';

import 'package:flutter/material.dart';

//constants
import 'package:puranapustaks/constants/customColor.dart';
import 'package:puranapustaks/screens/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //Splash Screen
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Login())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: createMaterialColor(Color(0xFFf7fdf7)),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/3,
            ),
            Center(
              child: Image(
                height: MediaQuery.of(context).size.width/3,
                width: MediaQuery.of(context).size.width/3,
                image: AssetImage('images/logos/Puranapustaks.png'),
              ),
            ),
            Center(child: Text("Puranapustaks", style: TextStyle(color: createMaterialColor(Color(0xFF006600)), fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}