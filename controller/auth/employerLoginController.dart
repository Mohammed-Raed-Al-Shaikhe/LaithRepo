import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/requestStatus.dart';
import '../../core/constant/routesNames.dart';
import '../../core/functions/handlingData.dart';
import '../../core/services/myService.dart';
import '../../data/auth/employerData/employerLoginModel.dart';

abstract class EmployerLoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
}

class EmployerLoginControllerImpl extends EmployerLoginController{

  late final TextEditingController email ;
  late final TextEditingController password ;
  late final GlobalKey<FormState> formKey2 ;
  EmployerLoginModel employerLoginModel = EmployerLoginModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  var isPasswordHidden = true.obs;
  MyServices myService = Get.find();


  @override
  login() async {
    var formData = formKey2.currentState;
    if(formData!.validate()) {
      requestStatus = RequestStatus.loading;
      var response = await employerLoginModel.getData(
          {
            "email" : email.text,
            "password" : password.text,
          }
      );
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success){
        if(response['status'] == 'success'){
          await myService.sharedPreferences.setInt("Employer_id", response['data']['employer_id']);
          await myService.sharedPreferences.setString("Employer_firstName", response['data']['employer_firstName']);
          await myService.sharedPreferences.setString("Employer_lastName", response['data']['employer_lastName']);
          await myService.sharedPreferences.setString("Employer_email", response['data']['employer_email']);
          await myService.sharedPreferences.setString("Employer_businessName", response['data']['employer_businessName']);
          await myService.sharedPreferences.setString("Employer_phone", response['data']['employer_phone'].toString());
          await myService.sharedPreferences.setString("Employer_image", "http://10.0.2.2/jobflex/upload/${response['data']['employer_image']}".toString());
          await myService.sharedPreferences.setString("Employer_about", response['data']['employer_aboutus']??"");
          await myService.sharedPreferences.setString("Employer_location", response['data']['employer_location']);
          await myService.sharedPreferences.setString("Employer_status", response['data']['employer_status']);
          if(response['data']['employer_status']=="active"){
            Get.offNamed(AppRoutes.employerHomePage);
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
    Get.offNamed(AppRoutes.employerSignUp);
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
    formKey2 = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

}