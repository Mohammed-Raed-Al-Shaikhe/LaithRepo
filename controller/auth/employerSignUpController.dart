import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';
import 'package:job_flix_application/core/constant/routesNames.dart';
import 'package:job_flix_application/data/auth/employerData/employerSignUpModel.dart';
import '../../core/functions/handlingData.dart';

abstract class EmployerSignUpController extends GetxController{
  signUp();
  goToLogin();
}

class EmployerSignUpControllerImpl extends EmployerSignUpController{

  late final GlobalKey<FormState> formKey2;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController businessNameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController registrationNumberController;
  late final TextEditingController passwordController;
  RequestStatus requestStatus = RequestStatus.none;
  EmployerSignUpModel employerSignUpModel = EmployerSignUpModel(Get.find());
  var isPasswordHidden = true.obs;

  @override
  signUp() async {
    var formData = formKey2.currentState;
    if(formData!.validate()){
      requestStatus = RequestStatus.loading;
      var response = await employerSignUpModel.getData(
          {
            "firstName" : firstNameController.text,
            "lastName" : lastNameController.text,
            "businessName" : businessNameController.text,
            "email" : emailController.text,
            "phone" : phoneController.text,
            "password" : passwordController.text,
            "companyNumber" : registrationNumberController.text,
          }
      );
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success){
        if(response['status'] == 'success'){
          Get.offNamed(AppRoutes.employerLogin);
        }else{
          showDialog(
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                  content: Text("The phone or email is already exists"),
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
  goToLogin() {
    Get.offNamed(AppRoutes.employerLogin);
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    businessNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    registrationNumberController = TextEditingController();
    passwordController = TextEditingController();
    formKey2 = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    businessNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}
