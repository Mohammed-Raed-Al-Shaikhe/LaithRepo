import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wedgits/jobSeekerWedgits/jobPostsCard.dart';

class JobsByFieldPage extends StatelessWidget {
  const JobsByFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final jobs = args['jobs'];
    final field = args['field'];
    final editedField = field.replaceAll( '&amp;','&');
    return Scaffold(
      appBar: AppBar(
        title: Text('$editedField Jobs'),
        backgroundColor: Colors.deepPurple,
      ),
      body: jobs.isEmpty
          ? Center(child: Text("No jobs found for $field"))
          : ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return JobPostsCard(
            company: '${job['job_owner']}',
            position: '${job['job_name']}',
            location: '${job['job_location']}',
            salary: '${job['job_salary']} ${job['job_salaryCurrency']}',
            job: job,
          );
        },
      ),
    );
  }
}