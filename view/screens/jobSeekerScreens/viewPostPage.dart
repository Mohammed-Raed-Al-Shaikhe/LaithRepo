import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/constant/routesNames.dart';
import 'package:job_flix_application/core/services/myService.dart';

class ViewPostPage extends StatelessWidget {
  final Map<String, dynamic> job;

  ViewPostPage({super.key, required this.job});
  final MyServices myServices = Get.find();
  @override
  Widget build(BuildContext context) {
    myServices.sharedPreferences.setInt("jobId", job['job_id']);
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      appBar: AppBar(
        title: Text(job['job_name'] ?? 'Job Details'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              color: Colors.deepPurple.shade50,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.deepPurple,
                      child: Text(
                        (job['job_owner'] ?? 'C')[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        job['job_owner'] ?? 'Unknown Company',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _infoRow(Icons.person, 'Position', job['job_name'] ?? 'N/A'),
                    Divider(),
                    _infoRow(Icons.work, 'Field', job['job_field'] ?? 'General'),
                    Divider(),
                    _infoRow(Icons.timer, 'Type', job['job_type'] ?? 'N/A'),
                    Divider(),
                    _infoRow(Icons.location_on, 'Location',
                        job['job_location'] ?? 'Not specified'),
                    Divider(),
                    _infoRow(Icons.attach_money, 'Salary',
                        "${job['job_salary'] ?? 'N/A'} ${job['job_salaryCurrency'] ?? 'N/A'}"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            _sectionCard(
              title: "Job Details",
              content: job['job_details'] ?? 'No details provided.',
            ),
            SizedBox(height: 20),
            _sectionCard(
              title: "Job Requirements",
              content: job['job_requirements'] ?? 'No requirements provided.',
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.applyJobPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 5,
                ),
                child: Text("Apply Now",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          SizedBox(width: 10),
          Text(
            "$label: ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({required String title, required String content}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple)),
            SizedBox(height: 10),
            Text(content, style: TextStyle(fontSize: 16, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}