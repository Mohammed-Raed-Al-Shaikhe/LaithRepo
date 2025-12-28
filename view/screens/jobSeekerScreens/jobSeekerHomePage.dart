import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/jobSeekerHomePageController.dart';
import '../../../core/services/myService.dart';
import '../../wedgits/employerWedgits/infoCard.dart';
import '../../wedgits/jobSeekerWedgits/jobPostsCard.dart';

class JobSeekerHomePage extends StatelessWidget {
   JobSeekerHomePage({super.key});
  final JobSeekerHomePageControllerImpl jobSeekerHomePageControllerImpl = Get.find<JobSeekerHomePageControllerImpl>();
  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE6D4FF),
        body: ListView(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Container(
                       width: double.infinity,
                        decoration: BoxDecoration(gradient: LinearGradient(
                           colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
                           begin: Alignment.topLeft,
                           end: Alignment.bottomRight,
                         ),
                        borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('Welcome!', style: TextStyle(color: Colors.white70, fontSize: 16)),
                                Text('${jobSeekerHomePageControllerImpl.firstname.value} ${jobSeekerHomePageControllerImpl.lastname.value}',
                                   style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                                  ],
                          ),
                     ),
                   ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:TextField(
                        onTap: () {
                          jobSeekerHomePageControllerImpl.goToSearchPage();
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Click Here To Search For Jobs",
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          prefixIcon: Icon(Icons.search,color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            )
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
                          InfoCard(number: jobSeekerHomePageControllerImpl.appliedJobsCount.toString(), label: "Jobs Applied", color: Colors.deepPurpleAccent, onTap: () {
                            jobSeekerHomePageControllerImpl.goToAppliedJobs();
                          }),
                          InfoCard(number: jobSeekerHomePageControllerImpl.interviewsCount.toString(), label: "Interviews", color: Colors.lightBlueAccent, onTap: () {
                            jobSeekerHomePageControllerImpl.goToInterviews();
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 70),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Recommended Jobs", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Obx(() => SizedBox(
                      height: 160,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: jobSeekerHomePageControllerImpl.recommendedJobs.length,
                        separatorBuilder: (context, index) => SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          final job = jobSeekerHomePageControllerImpl.recommendedJobs[index];
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            child: JobPostsCard(
                              company: '${job['job_owner']}',
                              position: '${job['job_name']}',
                              location: '${job['job_location']}',
                              salary: '${job['job_salary']} ${job['job_salaryCurrency']}',
                              job: jobSeekerHomePageControllerImpl.recommendedJobs[index],
                            ),
                          );
                        },
                      ),
                    )),
                    SizedBox(height: 60),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Recently Posted Jobs", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color:  Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child:Obx(() => Column(
                        children: List.generate(
                          jobSeekerHomePageControllerImpl.recentJobs.length,
                              (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: JobPostsCard(
                              company: '${jobSeekerHomePageControllerImpl.recentJobs[index]['job_owner']}',
                              position: '${jobSeekerHomePageControllerImpl.recentJobs[index]['job_name']}',
                              location: '${jobSeekerHomePageControllerImpl.recentJobs[index]['job_location']}',
                              salary: '${jobSeekerHomePageControllerImpl.recentJobs[index]['job_salary']} ${jobSeekerHomePageControllerImpl.recentJobs[index]['job_salaryCurrency']}',
                              job: jobSeekerHomePageControllerImpl.recentJobs[index],
                            ),
                          ),
                        ),
                      )),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ]
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
                    jobSeekerHomePageControllerImpl.goToJobSeekerProfile();
                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.message),
                  color: Colors.white,
                  onPressed: () {}),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.article),
                  color: Colors.white,
                  onPressed: () {
                    jobSeekerHomePageControllerImpl.getJobSeekerContracts();
                    jobSeekerHomePageControllerImpl.goToJobSeekerContracts();
                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {}),
            ],
          ),
        )
    );
  }
}