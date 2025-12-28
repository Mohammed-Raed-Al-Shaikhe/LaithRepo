import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/rejectContractController.dart';
import '../../../core/constant/routesNames.dart';
import '../../wedgits/auth/customMaterialButton.dart';

class JobSeekerContractDetails extends StatelessWidget {
  const JobSeekerContractDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final contract = Get.arguments;
    RejectContractController rejectContractController = Get.put(RejectContractController());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        title: Text("Contract Details",style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple.shade400,
                Colors.deepPurple.shade200,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(contract["contract_title"] ?? "Employment Contract",style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              _sectionTitle("Employer Information"),// ==== Employer INFO ====
              _infoTile("Company Name","${contract["employer_businessName"]}"),
              _infoTile("Job Title", contract["job_name"]),
              _infoTile("Job Field", contract["job_field"]),
              SizedBox(height: 20),
              _sectionTitle("Contract Details"), // ==== CONTRACT DETAILS ====
              _infoTile("Start Date", contract["start_date"]),
              _infoTile("End Date", contract["end_date"]),
              _infoTile("Salary", "${contract["salary"]} ${contract["job_salaryCurrency"]}"),
              _infoTile("Job Type", contract["job_type"].toString().toUpperCase()),
              SizedBox(height: 20),
              _sectionTitle("Contract Body"),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(contract["contract_body"] ?? "",style: TextStyle(fontSize: 16,height: 1.5),
                ),
              ),
              SizedBox(height: 20),
              _sectionTitle("Signatures"),// ==== SIGNATURES ====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _signatureBox("Employer Signature",contract["employer_signature"]),
                  SizedBox(width: 5),
                  _signatureBox("Job Seeker Signature",contract["jobseeker_signature"]),
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomMaterialButton(text: 'Sign',buttonColor:Colors.green,textColor:Colors.black,onPressed: (){
                  if(contract["contract_status"] == "signed"){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Warning"),
                            content: Text("You have already signed this contract."),
                          );
                        }
                    );
                    return;
                  }else{
                    Get.toNamed(AppRoutes.signContract,arguments: {
                      "contract_id": contract["contract_id"]
                    });
                  }
                }),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomMaterialButton(text: 'Request For Changes',buttonColor:Colors.amberAccent,textColor:Colors.black,onPressed: (){
                  if(contract["contract_status"] == "signed"){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Warning"),
                            content: Text("You cannot request changes for a signed contract."),
                          );
                        }
                    );
                    return;
                  }else{
                    Get.toNamed(AppRoutes.requestContractChanges,arguments: {
                      "contract_id": contract["contract_id"]
                    });
                  }
                }),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomMaterialButton(text: 'Reject',buttonColor:Colors.red,textColor:Colors.black,onPressed: (){
                  if(contract["contract_status"] == "signed"){
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Warning"),
                            content: Text("You cannot reject a signed contract."),
                          );
                        }
                    );
                    return;
                  }else{
                    rejectContractController.reject(contract["contract_id"]);
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _infoTile(String label, dynamic value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Text(
              value?.toString() ?? "",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _signatureBox(String title, String? signature) {
    return Expanded(
      child: Column(
        children: [
          Text(title,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 10),
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black54),
            ),
            child: Center(child: Text(signature??"No Signature",style:TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
            )
            ),
          ),
        ],
      ),
    );
  }
}
