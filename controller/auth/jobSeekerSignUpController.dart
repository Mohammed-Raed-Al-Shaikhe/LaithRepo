import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/constant/routesNames.dart';
import '../../core/class/requestStatus.dart';
import '../../core/functions/handlingData.dart';
import '../../core/services/myService.dart';
import '../../data/auth/jobSeekerData/jobSeekerSignUpModel.dart';

abstract class JobSeekerSignUpController extends GetxController{
  signUp();
  goToLogin();
}

class JobSeekerSignUpControllerImpl extends JobSeekerSignUpController{

  late final GlobalKey<FormState> formKey1;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController nationalIdController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  var selectedJobField = ''.obs;
  RequestStatus requestStatus = RequestStatus.none;
  JobSeekerSignUpModel jobSeekerSignUpModel = JobSeekerSignUpModel(Get.find());
  MyServices myServices = Get.find();
  var isPasswordHidden = true.obs;
  final jobFields = [
    "Technology & IT",
    "Finance",
    "Management",
    "Marketing",
    "Sales",
    "Human Resources",
    "Customer Service",
    "Education",
    "Healthcare",
    "Engineering & Manufacturing",
    "Science",
    "Art & Design",
    "Media",
    "Law",
    "Agriculture, Food & Nutrition",
    "Restaurant",
    "Tourism, Hospitality & Transportation",
    "Real Estate & Construction",
    "Trades",
    "Free Business",
    "other"
  ];

  @override
  signUp() async {
    var formData = formKey1.currentState;
    if(formData!.validate()){
      requestStatus = RequestStatus.loading;
      var response = await jobSeekerSignUpModel.getData(
          {
            "firstName" : firstNameController.text,
            "lastName" : lastNameController.text,
            "nationalID" : nationalIdController.text,
            "email" : emailController.text,
            "phone" : phoneController.text,
            "password" : passwordController.text,
            "jobField" : selectedJobField.value,
          }
      );
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success){
        if(response['status'] == 'success'){
          Get.offNamed(AppRoutes.jobSeekerLogin);
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
   Get.offNamed(AppRoutes.jobSeekerLogin);
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    nationalIdController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey1 = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    nationalIdController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}