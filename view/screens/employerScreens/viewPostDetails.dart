import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewPostDetails extends StatelessWidget {
  const ViewPostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Map post = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(post['job_name'] ?? 'Post Details'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItem("Job Name", post['job_name']),
            _buildItem("Job Details", post['job_details']),
            _buildItem("Requirements", post['job_requirements']),
            _buildItem("Field", post['job_field']),
            _buildItem("Type", post['job_type']),
            _buildItem("Salary", "${post['job_salary']} ${post['job_salaryCurrency']}"),
            _buildItem("Location", post['job_location']),
            _buildItem("Owner", post['job_owner']),
            _buildItem("Posted At", post['job_date']),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String title, String? value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.deepPurple,
              )),
          SizedBox(height: 4),
          Text(value ?? "N/A",style: TextStyle(fontSize: 15)),
          Divider(),
        ],
      ),
    );
  }
}