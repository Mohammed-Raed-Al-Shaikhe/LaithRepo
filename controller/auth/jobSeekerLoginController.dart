import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/controller/jobSeekerHomePageController.dart';
import 'package:job_flix_application/data/auth/jobSeekerData/jobSeekerLoginModel.dart';
import '../../core/class/requestStatus.dart';
import '../../core/constant/routesNames.dart';
import '../../core/functions/handlingData.dart';
import '../../core/services/myService.dart';


abstract class JobSeekerLoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class JobSeekerLoginControllerImpl extends JobSeekerLoginController{

  late final TextEditingController email ;
  late final TextEditingController password ;
  late final GlobalKey<FormState> formKey3 ;
  JobSeekerLoginModel jobSeekerLoginModel = JobSeekerLoginModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  var isPasswordHidden = true.obs;
  MyServices myService = Get.find();


  @override
  login() async {
    var formData = formKey3.currentState;
    if(formData!.validate()) {
      requestStatus = RequestStatus.loading;
      var response = await jobSeekerLoginModel.getData(
          {
            "email" : email.text,
            "password" : password.text,
          }
      );
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success){
        if(response['status'] == 'success'){
          await myService.sharedPreferences.setInt("Seeker_id", response['data']['jobseeker_id']);
          await myService.sharedPreferences.setString("Seeker_firstName", response['data']['jobseeker_firstName']??"first name");
          await myService.sharedPreferences.setString("Seeker_lastName", response['data']['jobseeker_lastName']??"last name");
          await myService.sharedPreferences.setString("Seeker_email", response['data']['jobseeker_email']??"email");
          await myService.sharedPreferences.setString("Seeker_phone", response['data']['jobseeker_phone']?.toString()??"phone");
          await myService.sharedPreferences.setString("Seeker_image", "http://10.0.2.2/jobflex/upload/${response['data']['jobseeker_image']}".toString());
          await myService.sharedPreferences.setString("Seeker_about", response['data']['jobseeker_about']?.toString()??"about");
          await myService.sharedPreferences.setString("Seeker_location", response['data']['jobseeker_location']?.toString()??"location");
          await myService.sharedPreferences.setString("Seeker_experience", response['data']['jobseeker_experience']?.toString()??"experience");
          await myService.sharedPreferences.setString("Seeker_education", response['data']['jobseeker_education']?.toString()??"education");
          await myService.sharedPreferences.setString("Seeker_position", response['data']['jobseeker_position']?.toString()??"position");
          await myService.sharedPreferences.setString("Seeker_skills", response['data']['jobseeker_skills']?.toString()??"skills");
          String rawField = response['data']['jobseeker_jobField']?.toString()??'field';
          String cleanField = rawField.replaceAll('&amp;', '&');
          await myService.sharedPreferences.setString("Seeker_field",cleanField);
          if(!Get.isRegistered<JobSeekerHomePageControllerImpl>()){
            Get.put(JobSeekerHomePageControllerImpl());
          }
          if(response['data']['jobseeker_status'] == "active"){
            Get.offNamed(AppRoutes.jobSeekerHomePage);
          }else{
            Get.offNamed(AppRoutes.suspendPage);
          }
        }else{
          showDialog(
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                  content: Text("You do not have an account \n please sign up"),
                );
              }
          );
          requestStatus = RequestStatus.failure;
        }
      }
      update();
    }else{
      print("not valid");
    }

  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.jobSeekerSignUp);
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    formKey3 = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

}