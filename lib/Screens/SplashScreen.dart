import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appnew/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
static String id ='splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.popAndPushNamed(context,HomeScreen.id);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: 


          Center(
            child: Image.asset('assets/2423.png',height: 1.sh,width: 1.sw,),
        ),


    );
  }
}

