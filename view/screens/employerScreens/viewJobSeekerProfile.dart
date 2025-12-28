import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wedgits/jobSeekerWedgits/profileInfoCard.dart';

class ViewJobSeekerProfile extends StatelessWidget {
  final dynamic seeker = Get.arguments;
  ViewJobSeekerProfile({super.key});

  // Future<void> sendEmail() async {
  //   final Uri emailUri = Uri(
  //     scheme: 'mailto',
  //     path: 'support@jobflix.com',
  //     query: 'subject=Message from JobFlix Issue&body=Hello JobFlix Team,',
  //   );
  //
  //   if (await canLaunchUrl(emailUri)) {
  //     await launchUrl(emailUri);
  //   } else {
  //     throw 'Could not open email app';
  //   }
  // }
  @override
  Widget build(BuildContext context) {
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
                          backgroundImage: NetworkImage(seeker['jobseeker_image']??'No Image Available'),
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("${seeker['jobseeker_firstName']} ${seeker['jobseeker_lastName']}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  Text("${seeker['jobseeker_location']}",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("${seeker['jobseeker_position']}",
                      style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            ProfileInfoCard(title: "About", content: "${seeker['jobseeker_about']}"),
            ProfileInfoCard(title: "Contact Information", content: "📞 0${seeker['jobseeker_phone']}\n ✉ ${seeker['jobseeker_email']}"),
            ProfileInfoCard(title: "Work Experience", content: "${seeker['jobseeker_experience']} year(s)"),
            ProfileInfoCard(title: "Education", content: "${seeker['jobseeker_education']}"),
            ProfileInfoCard(title: "Skills", content: "${seeker['jobseeker_skills']}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:(){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text("Send Email",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}