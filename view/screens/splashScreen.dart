import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onBoardingscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.offAll(OnBoardingScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "images/splashbg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              Container(
                padding: EdgeInsets.only(left:65),
                  child: Image.asset("images/jobflixlogo.png",width: 300,)
              ),
          ]
          )
        ],
      ),
    );
  }
}


