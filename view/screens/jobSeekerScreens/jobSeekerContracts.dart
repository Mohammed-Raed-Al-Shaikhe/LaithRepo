import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/jobSeekerHomePageController.dart';
import '../../../core/class/requestStatus.dart';
import '../../../core/constant/routesNames.dart';

class JobSeekerContracts extends StatelessWidget {
  const JobSeekerContracts({super.key});

  @override
  Widget build(BuildContext context) {
    JobSeekerHomePageControllerImpl jobSeekerHomePageControllerImpl = Get.put(JobSeekerHomePageControllerImpl());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Contracts",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),

      body: GetBuilder<JobSeekerHomePageControllerImpl>(
        builder: (_) {
          if (jobSeekerHomePageControllerImpl.requestStatus == RequestStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (jobSeekerHomePageControllerImpl.contracts.isEmpty) {
            return  Center(
              child: Text("No Contracts Found",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: jobSeekerHomePageControllerImpl.contracts.length,
            itemBuilder: (context, index) {
              var contract = jobSeekerHomePageControllerImpl.contracts[index];
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
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: contract["employer_image"] != null
                                ? NetworkImage(contract["employer_image"])
                                : null,
                            child: contract["employer_image"] == null
                                ? const Icon(Icons.person, size: 35)
                                : null,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${contract["employer_businessName"]}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text("Job: ${contract["job_name"]}",style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black
                                ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                            decoration: BoxDecoration(
                              color: _statusColor(contract["contract_status"]),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(contract["contract_status"] ?? "",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoutes.jobSeekerContractDetails,arguments: contract);
                          },
                          child: Text("View Details",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Color _statusColor(String? status) {
    switch (status?.toLowerCase()) {
      case "pending":
        return Colors.orange;
      case "signed":
        return Colors.green;
      case "requested_changes":
        return Colors.deepOrangeAccent;
      case "rejected":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

}


