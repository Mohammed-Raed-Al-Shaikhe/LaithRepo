import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/constant/routesNames.dart';
import 'package:job_flix_application/core/services/myService.dart';
import 'package:job_flix_application/view/screens/employerScreens/pdfViewer.dart';
import 'package:job_flix_application/view/screens/employerScreens/scheduleAnInterview.dart';
import '../../../controller/employerHomePageController.dart';
import '../../../controller/jobApplicationsPageController.dart';

class JobApplications extends StatelessWidget {
  const JobApplications({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EmployerHomePageControllerImpl>();
    JobApplicationControllerImpl jobApplicationControllerImpl = Get.put(JobApplicationControllerImpl());
    MyServices myServices = Get.find();
    return Scaffold(
      backgroundColor: Color(0xFFF3E8FF),
      appBar: AppBar(
        title: Text("Job Applications"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Obx(() {
        var applications = controller.jobApplications;
        if (applications.isEmpty) {
          return Center(
            child: Text("No Applications Found",style: TextStyle(fontSize: 16)),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(12),
          itemCount: applications.length,
          itemBuilder: (context, index) {
            final app = applications[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.7),
                    blurRadius: 8,
                    offset: Offset(-2, -2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: (app['jobseeker_image'] != null &&
                            app['jobseeker_image'] != "no image")
                            ? NetworkImage(app['jobseeker_image'])
                            : NetworkImage("https://via.placeholder.com/150"),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${app['jobseeker_firstName']} ${app['jobseeker_lastName']}",style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(
                                    blurRadius: 4,
                                    color: Colors.black26,
                                    offset: Offset(1, 1),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              app['jobseeker_position'] ?? "",
                              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          jobApplicationControllerImpl.updateStatus(
                            app['application_id'].toString(),
                            value,
                          );
                        },
                        itemBuilder: (_) => [
                          PopupMenuItem(
                            value: "accepted",
                            child: Row(
                              children: [
                                Icon(Icons.check_circle, color: Colors.green),
                                SizedBox(width: 8),
                                Text("Accept"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: "rejected",
                            child: Row(
                              children: [
                                Icon(Icons.cancel, color: Colors.red),
                                SizedBox(width: 8),
                                Text("Reject"),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: "pending",
                            child: Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.orange),
                                SizedBox(width: 8),
                                Text("Pending"),
                              ],
                            ),
                          ),
                        ],
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                jobApplicationControllerImpl.getStatusIcon(app['application_status']),
                                size: 18,
                                color: jobApplicationControllerImpl.getStatusColor(app['application_status']),
                              ),
                              SizedBox(width: 6),
                              Text(
                                app['application_status'].toString().capitalizeFirst!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.black87),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12),
                  if (app['application_status'] == "accepted")
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(AppRoutes.contract,arguments: {
                            "application_id": app['application_id'],
                            "seeker_id": app['jobseeker_id'],
                            "job_id": app['job_id'],
                            "firstName": app['jobseeker_firstName'],
                            "lastName": app['jobseeker_lastName'],
                            "position": app['jobseeker_position'],
                            //"cv": app['cv_path'],
                          },
                        );
                      },
                      icon: Icon(Icons.description, color: Colors.white),
                      label: Text("Create Contract",style: TextStyle(color: Colors.white, fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      ),
                    ),

                  SizedBox(height: 12),
                  SizedBox(height: 14),
                  Text("Applied for : ${app['job_name']}",style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                  Text("Applied on : ${app['application_date']}",style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Text("Cover Letter",style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      app['application_coverLetter'] != null &&
                          app['application_coverLetter'].trim().isNotEmpty
                          ? app['application_coverLetter']
                          : "No cover letter provided.",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text("CV / Resume",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.white)),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      Get.to(PDFViewerPage(url: "http://10.0.2.2:8012/jobflex/${app['cv_path']}"));
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.picture_as_pdf, size: 32, color: Colors.redAccent),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(app['cv_path']?.split("/").last ?? "CV File",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            if (app['application_status'] == 'pending') {
                              Get.to(() => ScheduleAnInterview(
                                seekerId: app['jobseeker_id'].toString(),
                                employerId: myServices.sharedPreferences.getInt("Employer_id").toString(),
                                jobId: app['job_id'].toString(),
                              ));
                            }
                            else{
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("Schedule an Interview"),
                                      content: Text("You can only schedule an interview for pending applications."),
                                    );
                                  }
                              );
                            }
                          },
                          child: Text("Schedule an Interview", style: TextStyle(fontSize: 15,color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            side: BorderSide(color: Colors.white70),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoutes.viewJobSeekerProfile, arguments: app);
                          },
                          child: Text("View Profile",style: TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}