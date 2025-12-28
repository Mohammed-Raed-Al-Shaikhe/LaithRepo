import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/services/myService.dart';
import 'package:job_flix_application/view/wedgits/jobSeekerWedgits/profileInfoCard.dart';
import '../../../controller/employerHomePageController.dart';
import '../../../controller/employerProfileController.dart';

class EmployerProfilePage extends StatelessWidget {
  EmployerProfilePage({super.key});
  final MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    EmployerProfileControllerImpl employerProfileController = Get.put(EmployerProfileControllerImpl());
    EmployerHomePageControllerImpl employerHomePageControllerImpl =  Get.find<EmployerHomePageControllerImpl>();
    String? imageName = myServices.sharedPreferences.getString("Employer_image");
    String imageUrl;
    if (imageName == null || imageName.isEmpty || imageName.contains("no image")) {
      imageUrl = "https://via.placeholder.com/150";
    } else if (imageName.startsWith("http")) { // already full URL
      imageUrl = imageName;
    } else {
      imageUrl = "http://10.0.2.2/jobflex/upload/$imageName"; // only filename
    }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 280,
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
                              employerProfileController.editProfile();
                            }, icon: Icon(Icons.edit, color: Colors.white)),
                          ]
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("${myServices.sharedPreferences.getString("Employer_businessName")}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text("${myServices.sharedPreferences.getString("Employer_location")}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileInfoCard(title: "About Us", content: "${myServices.sharedPreferences.getString("Employer_about")}"),
            ProfileInfoCard(title: "Contact Information", content: "📞 0${myServices.sharedPreferences.getString(
                "Employer_phone")}\n ✉ ${myServices.sharedPreferences
                .getString("Employer_email")}"),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed:(){
               employerProfileController.goToMyPosts();
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
                "View My Posts",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                  employerHomePageControllerImpl.goToEmployerProfile();
                }),
            IconButton(iconSize: 30,
                icon: Icon(Icons.payment),
                color: Colors.white,
                onPressed: () {

                }),
            IconButton(iconSize: 30,
                icon: Icon(Icons.article),
                color: Colors.white,
                onPressed: () {
                  employerHomePageControllerImpl.getEmployerContracts();
                  employerHomePageControllerImpl.goToEmployerContracts();
                }),
            IconButton(iconSize: 30,
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  employerHomePageControllerImpl.goToEmployerHome();
                }),
          ],
        ),
      ),
    );
  }
}