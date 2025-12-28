import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PostingJobsController extends GetxController{
  goToPostDetails();
}

class PostingJobsControllerImpl extends PostingJobsController{

  late final TextEditingController jobTitle ;
  late final TextEditingController jobDescription ;
  late final TextEditingController jobRequirements ;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  goToPostDetails() {
    if(formKey.currentState!.validate()) {
      Get.toNamed('/jobPostDetails');
    }else{
        print("error");
    }

  }

  @override
  void onInit() {
    jobTitle = TextEditingController();
    jobDescription = TextEditingController();
    jobRequirements = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    jobTitle.dispose();
    jobDescription.dispose();
    jobRequirements.dispose();
    super.dispose();
  }

}