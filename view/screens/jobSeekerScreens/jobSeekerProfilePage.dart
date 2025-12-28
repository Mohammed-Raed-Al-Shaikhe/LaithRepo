import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/controller/jobSeekerHomePageController.dart';
import 'package:job_flix_application/controller/jobSeekerProfileController.dart';
import 'package:job_flix_application/core/services/myService.dart';
import 'package:job_flix_application/view/wedgits/jobSeekerWedgits/profileInfoCard.dart';

class JobSeekerProfilePage extends StatelessWidget {
  JobSeekerProfilePage({super.key});
  final MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    JobSeekerProfileControllerImpl jobSeekerProfileController = Get.put(JobSeekerProfileControllerImpl());
    JobSeekerHomePageControllerImpl jobSeekerHomePageController = Get.put(JobSeekerHomePageControllerImpl());
    String? imageName = myServices.sharedPreferences.getString("Seeker_image");
    String imageUrl = (imageName != null && imageName.isNotEmpty)
                       ? "http://10.0.2.2/jobflex/upload/$imageName"
                       : "https://via.placeholder.com/150";
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width:140),
                      Center(
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(imageUrl),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      SizedBox(width:90),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.settings, color: Colors.white)),
                          IconButton(onPressed: (){
                            jobSeekerProfileController.editProfile();
                          }, icon: Icon(Icons.edit, color: Colors.white)),
                        ]
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("${myServices.sharedPreferences.getString("Seeker_firstName")} ${myServices.sharedPreferences.getString("Seeker_lastName")}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  Text("${myServices.sharedPreferences.getString("Seeker_location")}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("${myServices.sharedPreferences.getString("Seeker_position")}",
                      style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileInfoCard(title: "About Me", content: "${myServices.sharedPreferences.getString("Seeker_about")}"),
            ProfileInfoCard(title: "Contact Information", content: "📞 0${myServices.sharedPreferences.getString(
                "Seeker_phone")}\n ✉ ${myServices.sharedPreferences
                .getString("Seeker_email")}"),
            ProfileInfoCard(title: "Work Experience", content: "${myServices.sharedPreferences.getString("Seeker_experience")} year(s)"),
            ProfileInfoCard(title: "Education", content: "${myServices.sharedPreferences.getString("Seeker_education")}"),
            ProfileInfoCard(title: "Skills", content: "${myServices.sharedPreferences.getString("Seeker_skills")}"),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(iconSize: 30,
                icon: Icon(Icons.person),
                color: Colors.white,
                onPressed: () {
                  jobSeekerHomePageController.goToJobSeekerProfile();
                }),
            IconButton(iconSize: 30,
                icon: Icon(Icons.message),
                color: Colors.white,
                onPressed: () {}),
            IconButton(iconSize: 30,
                icon: Icon(Icons.article),
                color: Colors.white,
                onPressed: () {
                  jobSeekerHomePageController.getJobSeekerContracts();
                  jobSeekerHomePageController.goToJobSeekerContracts();
                }),
            IconButton(iconSize: 30,
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  jobSeekerHomePageController.goToJobSeekerHome();
                }),
          ],
        ),
      ),
    );
  }
}