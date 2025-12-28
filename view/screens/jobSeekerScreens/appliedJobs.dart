import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/controller/jobSeekerHomePageController.dart';
import 'package:job_flix_application/view/wedgits/jobSeekerWedgits/appliedJobCard.dart';

class AppliedJobs extends StatelessWidget {
  const AppliedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    final JobSeekerHomePageControllerImpl jobSeekerHomePageController =
        Get.find<JobSeekerHomePageControllerImpl>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Applied Jobs',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  filterButton("All", jobSeekerHomePageController),
                  filterButton("pending", jobSeekerHomePageController),
                  filterButton("accepted", jobSeekerHomePageController),
                  filterButton("rejected", jobSeekerHomePageController),
                ],
              );
            }),
          ),

          Expanded(
            child: Obx(() {
              var jobs = jobSeekerHomePageController.filteredAppliedJobs;
              if (jobs.isEmpty) {
                return const Center(child: Text("No jobs for selected filter"));
              }
              return ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return AppliedJobCard(
                    company: job['job_owner'] ?? 'owner',
                    location: job['job_location'] ?? 'location',
                    role: job['job_name'] ?? 'name',
                    appliedTime: job['application_date'] ?? "date",
                    jobType: job['job_type'] ?? "type",
                    status: job['application_status'] ?? 'status',
                    field: job['job_field'] ?? 'field',
                    salary: job['job_salary'] ?? 0,
                    currency: job['job_salaryCurrency'] ?? 'currency',
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}


Widget filterButton(String label, controller) {
  bool isSelected = controller.selectedStatus.value == label;
  return GestureDetector(
    onTap: () => controller.selectedStatus.value = label,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurpleAccent : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurpleAccent,width: 2),
      ),
      child: Text(label.toUpperCase(),style: TextStyle(
          color: isSelected ? Colors.white : Colors.deepPurpleAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
