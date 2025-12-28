import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/controller/auth/jobSeekerSignUpController.dart';
import '../../../../core/class/handlingDataRequest.dart';
import '../../../wedgits/auth/customMaterialButton.dart';
import '../../../wedgits/auth/customTextFormField.dart';
import '../../../wedgits/employerWedgits/jobField.dart';


class JobSeekerSignUp extends StatelessWidget {
  const JobSeekerSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(JobSeekerSignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title:Text('Job Seeker Registration',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: GetBuilder<JobSeekerSignUpControllerImpl>(
        builder: (JobSeekerSignUpControllerImpl jobSeekerSignUpController) {
          return  HandlingDataRequest(
                  requestStatus: jobSeekerSignUpController.requestStatus,
                  widget:  Form(
                    key: jobSeekerSignUpController.formKey1,
                    child: ListView(
                      padding:EdgeInsets.all(20),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Create an Account',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Please fill registration form below',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(hintText: 'First Name',suffixIcon: Icon(Icons.person),myController: jobSeekerSignUpController.firstNameController,keyboardType: 'text',myValidator: (value){
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                    return null;
                                  }),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: CustomTextFormField(hintText: 'Last Name',myController: jobSeekerSignUpController.lastNameController,keyboardType: 'text',myValidator: (value){
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your last name';
                                    }
                                    return null;
                                  }),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            CustomTextFormField(hintText: 'National ID',suffixIcon: Icon(Icons.badge),myController: jobSeekerSignUpController.nationalIdController,keyboardType: 'phone',myValidator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter your national ID';
                              }
                              return null;
                            }),
                            SizedBox(height: 20),
                            CustomTextFormField(hintText: 'Phone Number',suffixIcon: Icon(Icons.phone),myController: jobSeekerSignUpController.phoneController,keyboardType: 'phone',myValidator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            }),
                            SizedBox(height: 20),
                            CustomTextFormField(hintText: 'Email', myController: jobSeekerSignUpController.emailController,suffixIcon: Icon(Icons.email),keyboardType: 'email', myValidator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter your email';
                              }
                              if(!value.contains('@')){
                                return 'please enter a valid email';
                              }
                              return null;
                            }),
                            SizedBox(height: 20),
                            Obx(() => JobField(title: jobSeekerSignUpController.selectedJobField.value.isEmpty? "Job Field" : jobSeekerSignUpController.selectedJobField.value, onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.deepPurpleAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                ),
                                builder: (BuildContext context) {
                                  return ListView.builder(
                                    itemCount: jobSeekerSignUpController.jobFields.length,
                                    itemBuilder: (context, index) {
                                      final jobField = jobSeekerSignUpController.jobFields[index];
                                      return ListTile(
                                        title: Text(jobField),
                                        onTap: () {
                                          jobSeekerSignUpController.selectedJobField.value = jobField;
                                          Get.back();
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            })),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              child: Obx((){
                                return CustomTextFormField(hintText: 'Password',suffixIcon: IconButton(onPressed: jobSeekerSignUpController.togglePasswordVisibility, icon: Icon(jobSeekerSignUpController.isPasswordHidden.value ? Icons.visibility : Icons.visibility_off)),prefixIcon: Icon(Icons.lock),myController: jobSeekerSignUpController.passwordController,keyboardType: 'password',myValidator: (value){
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                                  obscureText: jobSeekerSignUpController.isPasswordHidden.value,
                                );
                              }),
                            ),
                            SizedBox(height: 25),
                            CustomMaterialButton(text: 'CREATE ACCOUNT',buttonColor:Colors.indigo,textColor:Colors.white,onPressed: (){
                              jobSeekerSignUpController.signUp();
                            }),
                            SizedBox(height: 15),
                            Center(
                              child: Text.rich(
                                TextSpan(
                                  text: 'By tapping "CREATE ACCOUNT" you accept our ',
                                  style: TextStyle(fontSize: 14,color: Colors.grey.shade800),
                                  children: [
                                    TextSpan(
                                      text: 'terms and conditions',
                                      style: TextStyle(
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Center(
                              child: Text("Already have an account ?",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800
                              ),),
                            ),
                            SizedBox(height: 15),
                            CustomMaterialButton(text: 'LOGIN',buttonColor:Colors.grey.shade400,textColor:Colors.indigo,onPressed: (){
                              jobSeekerSignUpController.goToLogin();
                            }),
                          ],
                        ),
                      ],
                    ),//
                  )
          );

        }),
    );
  }
}


