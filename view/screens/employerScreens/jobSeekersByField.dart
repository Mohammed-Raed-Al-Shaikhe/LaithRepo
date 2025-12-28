import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wedgits/employerWedgits/jobSeekerCard.dart';

class JobSeekersByFieldPage extends StatelessWidget {
  const JobSeekersByFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final jobSeekers = args['jobSeekers'];
    final field = args['field'];
    final editedField = field.replaceAll( '&amp;','&');
    return Scaffold(
      appBar: AppBar(
        title: Text('$editedField Job Seekers'),
        backgroundColor: Colors.deepPurple,
      ),
      body: jobSeekers.isEmpty
          ? Center(child: Text("No job Seekers found for $field"))
          : ListView.builder(
        itemCount: jobSeekers.length,
        itemBuilder: (context, index) {
          final seeker = jobSeekers[index];
          return Container(
            height: 150,
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
    );
  }
}