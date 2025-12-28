import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/view/wedgits/auth/customMaterialButton.dart';
import '../../../controller/employerHomePageController.dart';
import '../../../controller/employerProfileController.dart';
import '../../../controller/jobPostDetailsController.dart';
import '../../wedgits/employerWedgits/jobField.dart';
import '../../wedgits/employerWedgits/jobTypeBottomSheet.dart';
import '../../wedgits/employerWedgits/salaryBottomSheet.dart';

class JobPostDetails extends StatelessWidget {
  const JobPostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    EmployerProfileControllerImpl employerProfileController = Get.put(EmployerProfileControllerImpl());
    JobPostDetailsControllerImpl jobPostDetailsControllerImpl = Get.put(JobPostDetailsControllerImpl());
    EmployerHomePageControllerImpl employerHomePageControllerImpl =  Get.find<EmployerHomePageControllerImpl>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Job Post Details",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        leading: IconButton(icon:Icon(Icons.arrow_back, color: Colors.black),onPressed: () {
          Get.back();
        }),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text("Add Job Details Here",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Obx(() => JobField(title: jobPostDetailsControllerImpl.selectedJobField.value.isEmpty? "Job Field" : jobPostDetailsControllerImpl.selectedJobField.value, onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return ListView.builder(
                    itemCount: jobPostDetailsControllerImpl.jobFields.length,
                    itemBuilder: (context, index) {
                      final jobField = jobPostDetailsControllerImpl.jobFields[index];
                      return ListTile(
                        title: Text(jobField),
                        onTap: () {
                          jobPostDetailsControllerImpl.selectedJobField.value = jobField;
                          Get.back();
                        },
                      );
                    },
                  );
                },
              );
            })),
            Obx(() => JobField(title: jobPostDetailsControllerImpl.selectedJobType.value.isEmpty? "Job Type" : jobPostDetailsControllerImpl.selectedJobType.value, onPressed: (){
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return JobTypeBottomSheet();
                  }
              );
            })),
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobField(
                    title: jobPostDetailsControllerImpl.jobLocation.value.isEmpty
                        ? "Job Location"
                        : jobPostDetailsControllerImpl.jobLocation.value,
                    onPressed: () {
                      jobPostDetailsControllerImpl.showLocationField.value =
                      !jobPostDetailsControllerImpl.showLocationField.value;
                    },
                  ),

                  // Expandable TextField
                  if (jobPostDetailsControllerImpl.showLocationField.value)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Enter job location",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          jobPostDetailsControllerImpl.jobLocation.value = value;
                        },
                      ),
                    ),
                ],
              );
            }),
            Obx(() => JobField(title: jobPostDetailsControllerImpl.salary.value.isEmpty? "Salary And Payment Type" : "${jobPostDetailsControllerImpl.salary.value} ${jobPostDetailsControllerImpl.selectedCurrency.value} ${jobPostDetailsControllerImpl.selectedPaymentMethod.value}", onPressed: (){
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                      expand: false,
                      builder: (_,controller){
                        return SingleChildScrollView(
                          controller: controller,
                          child: SalaryBottomSheet(),
                        );
                      }
                    );
                  });
            })),
            SizedBox(height: 50),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: CustomMaterialButton(text: "POST JOB", buttonColor: Colors.deepPurple, textColor: Colors.white, onPressed:(){
                  jobPostDetailsControllerImpl.postJob();
                })
            )
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepPurple,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(iconSize: 30,
                  icon: Icon(Icons.person),
                  color: Colors.white,
                  onPressed: () {
                    employerHomePageControllerImpl.goToEmployerProfile();
                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.payment),
                  color: Colors.white,
                  onPressed: () {

                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.article),
                  color: Colors.white,
                  onPressed: () {
                    employerHomePageControllerImpl.getEmployerContracts();
                    employerHomePageControllerImpl.goToEmployerContracts();
                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {
                    employerHomePageControllerImpl.goToEmployerHome();
                  }),
            ],
          ),
        )
    );
  }
}