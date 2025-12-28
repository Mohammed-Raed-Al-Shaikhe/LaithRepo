import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/controller/employerHomePageController.dart';
import '../../../core/class/requestStatus.dart';
import '../../../core/constant/routesNames.dart';

class EmployerContracts extends StatelessWidget {
  const EmployerContracts({super.key});

  @override
  Widget build(BuildContext context) {
    EmployerHomePageControllerImpl employerHomePageControllerImpl = Get.put(EmployerHomePageControllerImpl());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Contracts",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),

      body: GetBuilder<EmployerHomePageControllerImpl>(
        builder: (_) {
          if (employerHomePageControllerImpl.requestStatus == RequestStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (employerHomePageControllerImpl.contracts.isEmpty) {
            return  Center(
              child: Text("No Contracts Found",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: employerHomePageControllerImpl.contracts.length,
            itemBuilder: (context, index) {
              var contract = employerHomePageControllerImpl.contracts[index];
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
                            backgroundImage: contract["jobseeker_image"] != null
                                ? NetworkImage(contract["jobseeker_image"])
                                : null,
                            child: contract["jobseeker_image"] == null
                                ? const Icon(Icons.person, size: 35)
                                : null,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${contract["jobseeker_firstName"]} ${contract["jobseeker_lastName"]}",
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
                            Get.toNamed(AppRoutes.employerContractDetails,arguments: contract);
                          },
                          child: Text("View Details",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      if(contract["contract_status"] == "requested_changes")
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrangeAccent,
                              padding: EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(AppRoutes.viewContractChanges,arguments: {
                                "changes": contract["changes"],
                              });
                            },
                            child: Text("View Changes",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                          ),
                        ),
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