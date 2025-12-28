import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/class/handlingDataRequest.dart';
import '../../../../controller/auth/employerSignUpController.dart';
import '../../../wedgits/auth/customMaterialButton.dart';
import '../../../wedgits/auth/customTextFormField.dart';


class EmployerSignUp extends StatelessWidget {

  const EmployerSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmployerSignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title:Text('Company Registration',style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: GetBuilder<EmployerSignUpControllerImpl>(
        builder: (EmployerSignUpControllerImpl employerSignUpController) {
          return  HandlingDataRequest(
                  requestStatus: employerSignUpController.requestStatus,
                  widget: Form(
                    key: employerSignUpController.formKey2,
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
                                  child: CustomTextFormField(hintText: 'First Name (Optional)',suffixIcon: Icon(Icons.person),myController: employerSignUpController.firstNameController,keyboardType: 'text'),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: CustomTextFormField(hintText: 'Last Name (Optional)',myController: employerSignUpController.lastNameController,keyboardType: 'text'),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            CustomTextFormField(hintText: 'Business Name (if Business/Company)',suffixIcon: Icon(Icons.badge),myController: employerSignUpController.businessNameController,keyboardType: 'text',myValidator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Business Name';
                              }
                              return null;
                            }),
                            SizedBox(height: 20),
                            CustomTextFormField(hintText: 'Phone Number',suffixIcon: Icon(Icons.phone),myController: employerSignUpController.phoneController,keyboardType: 'phone',myValidator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            }),
                            SizedBox(height: 20),
                            CustomTextFormField(hintText: 'Email', myController: employerSignUpController.emailController,suffixIcon: Icon(Icons.email),keyboardType: 'email', myValidator: (value){
                              if(value == null || value.isEmpty){
                                return 'Please enter your email';
                              }
                              if(!value.contains('@')){
                                return 'please enter a valid email';
                              }
                              return null;
                            }),
                            SizedBox(height: 20),
                            CustomTextFormField(hintText: 'Company Registration Number',myController: employerSignUpController.registrationNumberController,suffixIcon: Icon(Icons.shopping_bag),keyboardType: 'number',myValidator: (value){
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Company Registration Number';
                              }
                              return null;
                            }),
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              child: Obx((){
                                return CustomTextFormField(hintText: 'Password',suffixIcon: IconButton(onPressed: employerSignUpController.togglePasswordVisibility, icon: Icon(employerSignUpController.isPasswordHidden.value ? Icons.visibility : Icons.visibility_off)),prefixIcon: Icon(Icons.lock),myController: employerSignUpController.passwordController,keyboardType: 'password',myValidator: (value){
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                                  obscureText: employerSignUpController.isPasswordHidden.value,
                                );
                              }),
                            ),
                            SizedBox(height: 25),
                            CustomMaterialButton(text: 'CREATE ACCOUNT',buttonColor:Colors.indigo,textColor:Colors.white,onPressed: (){
                              employerSignUpController.signUp();
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
                              employerSignUpController.goToLogin();
                            }),
                          ],
                        ),
                      ],
                    ),//
                  )
          );
        },

      )
    );
  }
}


