import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/controller/postingJobsController.dart';
import 'package:job_flix_application/view/wedgits/employerWedgits/addPostTextFormField.dart';
import '../../../core/services/myService.dart';
import '../../wedgits/auth/customMaterialButton.dart';

class PostingJobs extends StatelessWidget {
  const PostingJobs({super.key});

  @override
  Widget build(BuildContext context) {
    PostingJobsControllerImpl postingJobsControllerImpl = Get.put(PostingJobsControllerImpl());
    MyServices myServices = Get.find();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Add Job Post"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
        body:SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10),
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
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              child: Form(
                key: postingJobsControllerImpl.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // IconButton(
                    //   onPressed: () {
                    //     Get.back();
                    //   },
                    //   icon: Icon(Icons.arrow_back, size: 28),
                    // ),
                    SizedBox(height: 10),
                     Text("Add Job Post",style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${myServices.sharedPreferences.getString("Employer_businessName")}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text("${myServices.sharedPreferences.getString("Employer_location")}",style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Job Post title",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    AddPostTextFormField(hint: "Write Your Job Title Here", controller: postingJobsControllerImpl.jobTitle,validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a job title';
                      }
                      return null;
                    }),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Job Description",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    AddPostTextFormField(maxLines: 5,hint: "Write Your Job Description Here", controller: postingJobsControllerImpl.jobDescription, validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a job description';
                      }
                      return null;
                    }),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Job Requirements",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    AddPostTextFormField(maxLines: 5,hint: "Write Your Job Requirements Here", controller: postingJobsControllerImpl.jobRequirements, validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter job requirements';
                      }
                      return null;
                    }),
                    SizedBox(height: 40),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: CustomMaterialButton(text: 'CONTINUE',buttonColor: Colors.deepPurple, textColor: Colors.white, onPressed: () {
                          postingJobsControllerImpl.goToPostDetails();
                        })
                    ),
                    SizedBox(height: 35),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
