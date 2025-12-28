import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/employerHomePageController.dart';

class EmployerInterviewsPage extends StatelessWidget {
  const EmployerInterviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EmployerHomePageControllerImpl>();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Interviews"),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Obx(() {
        var interviews = controller.interviews;
        if (interviews.isEmpty) {
          return Center(
            child: Text("No Interviews Found",style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: interviews.length,
          itemBuilder: (context, index) {
            var interview = interviews[index];
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: interview['jobseeker_image'] != null &&
                        interview['jobseeker_image'].isNotEmpty
                        ? NetworkImage(interview['jobseeker_image'])
                        : NetworkImage(
                      "https://via.placeholder.com/150",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${interview['jobseeker_firstName']} ${interview['jobseeker_lastName']}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text("${interview['jobseeker_position'] ?? 'Position not set'}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 8),
                        Text("Applied for : ${interview['job_name']}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepPurpleAccent),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.calendar_today,size: 16, color: Colors.grey.shade700),
                            SizedBox(width: 4),
                            Text("${interview['interview_date'] ?? '-'}",style: TextStyle(color: Colors.grey.shade700)),
                            SizedBox(width: 16),
                            Icon(Icons.access_time,size: 16, color: Colors.grey.shade700),
                            SizedBox(width: 4),
                            Text("${interview['interview_time'] ?? '-'}",style: TextStyle(color: Colors.grey.shade700),),
                          ],
                        ),
                      ],
                    ),
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