import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:job_flix_application/controller/jobSeekerHomePageController.dart';
import 'package:job_flix_application/core/services/myService.dart';
import '../data/auth/jobSeekerData/applyJobModel.dart';
import 'employerHomePageController.dart';

class ApplyJobController extends GetxController {

  final ApplyJobModel applyJobModel;

  ApplyJobController(this.applyJobModel);

  var coverLetterController = TextEditingController();
  var selectedFile = Rx<File?>(null);
  MyServices myServices = Get.find();
  var alreadyApplied = false.obs;

  void pickFile(File file) {
    selectedFile.value = file;
  }

  Future<void> submitApplication() async {
    if (selectedFile.value == null) {
      Get.snackbar(
        "Error",
        "Please select a CV file",
        snackPosition: SnackPosition.TOP,
      );
       return;
    }

    final response = await applyJobModel.apply(
      seekerId: myServices.sharedPreferences.getInt("Seeker_id").toString(),
      jobId: myServices.sharedPreferences.getInt("jobId").toString(),
      coverLetter: coverLetterController.text.trim(),
      cvFile: selectedFile.value,
    );

    final success = response["success"] == true;
    final message = response["message"] ?? "Something went wrong";

    if (success) {
      Get.snackbar("Success",
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      selectedFile.value = null;
      coverLetterController.clear();
      Get.find<JobSeekerHomePageControllerImpl>().getAppliedJobs();
      Get.find<EmployerHomePageControllerImpl>().getJobApplications();
    } else {
      Get.snackbar(
        "You Applied For This Before",
        duration: Duration(seconds: 10),
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      selectedFile.value = null;
      coverLetterController.clear();
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   //checkIfAlreadyApplied();
  // }

  @override
  void onClose() {
    coverLetterController.dispose();
    super.onClose();
  }
}