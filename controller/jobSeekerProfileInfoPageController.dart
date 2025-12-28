import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/constant/routesNames.dart';
import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';
import '../data/auth/jobSeekerData/jobSeekerProfileInfoModel.dart';

abstract class JobSeekerProfileInfoController extends GetxController {
  saveInfo();
}

class JobSeekerProfileInfoControllerImpl extends JobSeekerProfileInfoController {
  late TextEditingController aboutController;
  late TextEditingController locationController;
  late TextEditingController experienceController;
  late TextEditingController educationController;
  late TextEditingController positionController;
  late TextEditingController skillsController;
  late GlobalKey<FormState> profileFormKey;
  File? cvFile;
  RequestStatus requestStatus = RequestStatus.none;
  ProfileInfoModel profileInfoModel = ProfileInfoModel();
  MyServices myServices = Get.find();

  @override
  saveInfo() async {
    if (profileFormKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      var response = await profileInfoModel.getData(
          {
            "id" : myServices.sharedPreferences.getInt("Seeker_id").toString(),
            "aboutme" : aboutController.text,
            "location" : locationController.text,
            "experience" : experienceController.text,
            "education" : educationController.text,
            "position" : positionController.text,
            "skills" : skillsController.text,
          },
          cvFile,
      );
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success){
        if(response['status'] == 'success'){
          await myServices.sharedPreferences.setString("Seeker_about", aboutController.text);
          await myServices.sharedPreferences.setString("Seeker_location", locationController.text);
          await myServices.sharedPreferences.setString("Seeker_experience", experienceController.text);
          await myServices.sharedPreferences.setString("Seeker_education", educationController.text);
          await myServices.sharedPreferences.setString("Seeker_position", positionController.text);
          await myServices.sharedPreferences.setString("Seeker_skills", skillsController.text);
          await myServices.sharedPreferences.setString("profileInfo_${myServices.sharedPreferences.getInt("Seeker_id")}", "Done");
          Get.offNamed(AppRoutes.jobSeekerProfilePage);
        }else{
          showDialog(
              context: Get.context!,
              builder: (context) {
                return AlertDialog(
                  content: Text("Something went wrong"),
                );
              }
          );
          requestStatus = RequestStatus.failure;
        }
      }
      update();
    }else{
      print("error");
    }
  }

  @override
  void onInit() {
    profileFormKey = GlobalKey<FormState>();
    aboutController = TextEditingController();
    locationController = TextEditingController();
    experienceController = TextEditingController();
    educationController = TextEditingController();
    positionController = TextEditingController();
    skillsController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    aboutController.dispose();
    experienceController.dispose();
    educationController.dispose();
    skillsController.dispose();
    super.dispose();
  }


}