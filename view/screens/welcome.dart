import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/view/screens/auth/jobSeekerAuth/jobSeekerSignUp.dart';

import '../../controller/auth/jobSeekerSignUpController.dart';
import '../../core/constant/routesNames.dart';
import '../../core/services/myService.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    //MyServices myServices = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Image.asset(
                          "images/jobflixlogotype.png",
                          height: 100,
                          width: 300,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Welcome to \n   JobFLix",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Job Service Mobile App",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Continue as",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Choose to join JobFlix as either a JOBSEEKER to find jobs , or to post your Jobs as an Employer",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: (){
                      //myServices.sharedPreferences.setString("role","jobSeeker");
                      Get.toNamed(AppRoutes.jobSeekerSignUp);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(0, 30),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.purple.shade50,
                              radius: 28,
                              child:  ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.asset(
                                  "images/jobseeker.jpg",
                                  height: 50,
                                  width: 50,
                                ),
                              )
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "JOB SEEKER",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Finding a job is easier than ever in JobFlix",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      //myServices.sharedPreferences.setString("role","employer");
                      Get.toNamed(AppRoutes.employerSignUp);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.purple.shade50,
                              radius: 28,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: Image.asset(
                                  "images/employer.jpg",
                                  height: 50,
                                  width: 50,
                                ),
                              )
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "COMPANY / EMPLOYER",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "Let’s recruit your best candidates for your Jobs",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}