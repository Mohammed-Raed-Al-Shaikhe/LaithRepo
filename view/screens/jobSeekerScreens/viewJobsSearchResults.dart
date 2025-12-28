import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wedgits/jobSeekerWedgits/jobPostsCard.dart';

class ViewJobsSearchResults extends StatelessWidget {
  const ViewJobsSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final matchedJobs = args['matchedJobs'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: matchedJobs.isEmpty
          ? Center(child: Text("No Matched Results"))
          : ListView.builder(
        itemCount: matchedJobs.length,
        itemBuilder: (context, index) {
          final job = matchedJobs[index];
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