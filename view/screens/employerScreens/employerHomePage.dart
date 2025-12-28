import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/employerHomePageController.dart';
import '../../../core/services/myService.dart';
import '../../wedgits/employerWedgits/infoCard.dart';
import '../../wedgits/employerWedgits/jobSeekerCard.dart';

class EmployerHomePage extends StatelessWidget {
  EmployerHomePage({super.key});
  final MyServices myServices = Get.find();

  @override
  Widget build(BuildContext context) {
    EmployerHomePageControllerImpl employerHomePageControllerImpl =  Get.find<EmployerHomePageControllerImpl>();
    return Scaffold(
      backgroundColor: Color(0xFFE6D4FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF6C00FF), Color(0xFF7F1CFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 16),),
                        SizedBox(height: 5),
                        Text("${myServices.sharedPreferences.getString("Employer_businessName")}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.purple),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:TextField(
                    onTap: () {
                      employerHomePageControllerImpl.goToSearchPage();
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Click Here To Search For Job Seekers",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoCard(number: "${employerHomePageControllerImpl.applicationsCount}",label: "Job Applications",color: Colors.deepPurpleAccent,onTap:(){
                      employerHomePageControllerImpl.goToJobApplications();
                    }),
                    InfoCard(number: "${employerHomePageControllerImpl.interviewsCount}",label: "Interviews",color: Colors.lightBlueAccent,onTap:(){
                      employerHomePageControllerImpl.goToInterviews();
                    }),
                  ],
                ),
              ),
              SizedBox(height: 70),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Available Job Seekers",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SizedBox(height: 25),
              Obx(() => SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: employerHomePageControllerImpl.availableJobSeekers.length,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final seeker = employerHomePageControllerImpl.availableJobSeekers[index];
                    return SizedBox(
                      width: 400,
                      child: JobSeekerCard(
                        firstName: seeker['jobseeker_firstName'] ?? '',
                        lastName: seeker['jobseeker_lastName'] ?? '',
                        position: seeker['jobseeker_position'] ?? '',
                        location: seeker['jobseeker_location'] ?? '',
                        image: seeker['jobseeker_image'] ?? '',
                        seeker: seeker,
                      ),
                    );
                  },
                ),
              )),
              SizedBox(height: 60),
              Center(
                child: Text("Post New Job Listing",style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )),
              )
            ],
          ),
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
                    employerHomePageControllerImpl.goToEmployerPayments();
                  }
              ),
              SizedBox(width: 40),
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
                  onPressed: () {}),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          employerHomePageControllerImpl.goToPostingJobs();
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, size: 32,color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
