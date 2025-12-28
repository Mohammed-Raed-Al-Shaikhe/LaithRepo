import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/jobSeekerHomePageController.dart';
import '../../../core/constant/routesNames.dart';

class JobSeekerProfileWelcomingPage extends StatelessWidget {

   JobSeekerProfileWelcomingPage({super.key});
   final JobSeekerHomePageControllerImpl jobSeekerHomePageControllerImpl = Get.put(JobSeekerHomePageControllerImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi ${jobSeekerHomePageControllerImpl.firstname.value} ${jobSeekerHomePageControllerImpl.lastname.value}!",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              Text(
                "Let’s build your professional profile together.\n"
                    "It only takes a few minutes.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed:(){
                  Get.offNamed(AppRoutes.uploadJobSeekerImagePage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}