import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 120),
              Image.asset("images/onboarding.jpg",height: 300,width: 250),
              SizedBox(height:15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Text("Find jobs now or hire workers  for your business",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20,),
              Text("We make it easier for you to earn quick \n money by finding job faster,or hire \n workers for your jobs within our reliable \n jobs application",style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50,),
              InkWell(
                onTap: (){
                  Get.toNamed('/welcome');
                },
                child: Icon(Icons.arrow_circle_right_rounded,size: 75,color: Color.fromARGB(
                    255, 64, 24, 157)),
              )
            ],
          ),
        ]
      ),
    );
  }
}
