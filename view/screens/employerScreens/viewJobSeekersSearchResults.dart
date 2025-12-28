import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wedgits/employerWedgits/jobSeekerCard.dart';

class ViewJobSeekersSearchResults extends StatelessWidget {
  const ViewJobSeekersSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    final matchedJobSeekers = args['matchedJobSeekers'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: matchedJobSeekers.isEmpty
          ? Center(child: Text("No Matched Results"))
          : ListView.builder(
        itemCount: matchedJobSeekers.length,
        itemBuilder: (context, index) {
          final seeker = matchedJobSeekers[index];
          return Container(
            height: 140,
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