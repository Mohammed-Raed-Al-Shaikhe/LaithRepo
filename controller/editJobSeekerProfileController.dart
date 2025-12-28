import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/data/auth/jobSeekerData/editJobSeekerProfileModel.dart';
import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';

abstract class EditJobSeekerProfilePage extends GetxController{
  saveChanges();
}

class EditJobSeekerProfilePageImpl extends EditJobSeekerProfilePage{

  late TextEditingController editAboutController;
  late TextEditingController editLocationController;
  late TextEditingController editPositionController;
  late TextEditingController editEmailController;
  late TextEditingController editPhoneController;
  late TextEditingController editExperienceController;
  late TextEditingController editEducationController;
  late TextEditingController editSkillsController;
  MyServices myServices = Get.find();
  EditJobSeekerProfileModel editJobSeekerProfileModel = EditJobSeekerProfileModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;


  @override
  saveChanges() async{
    requestStatus = RequestStatus.loading;
    var response = await editJobSeekerProfileModel.getData(
      {
        "id" : myServices.sharedPreferences.getInt("Seeker_id").toString(),
        "about" : editAboutController.text,
        "location" : editLocationController.text,
        "experienceYears" : editExperienceController.text,
        "education" : editEducationController.text,
        "position" : editPositionController.text,
        "skills" : editSkillsController.text,
        "email" : editEmailController.text,
        "phone" : editPhoneController.text,
      }
    );
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success){
      if(response['status'] == 'success'){
        Get.snackbar("Success", "Changes saved successfully",backgroundColor: Colors.green, colorText: Colors.white);
        await myServices.sharedPreferences.setString("Seeker_about", editAboutController.text);
        await myServices.sharedPreferences.setString("Seeker_location", editLocationController.text);
        await myServices.sharedPreferences.setString("Seeker_experience", editExperienceController.text);
        await myServices.sharedPreferences.setString("Seeker_education", editEducationController.text);
        await myServices.sharedPreferences.setString("Seeker_position", editPositionController.text);
        await myServices.sharedPreferences.setString("Seeker_skills", editSkillsController.text);
        await myServices.sharedPreferences.setString("Seeker_email", editEmailController.text);
        await myServices.sharedPreferences.setString("Seeker_phone", editPhoneController.text);
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
  }

  @override
  void onInit() {
    editAboutController = TextEditingController(text: myServices.sharedPreferences.getString("Seeker_about"));
    editLocationController = TextEditingController(text: myServices.sharedPreferences.getString("Seeker_location"));
    editPositionController = TextEditingController(text: myServices.sharedPreferences.getString("Seeker_position"));
    editEmailController = TextEditingController(text: myServices.sharedPreferences.getString("Seeker_email"));
    editPhoneController = TextEditingController(text: myServices.sharedPreferences.getString("Seeker_phone"));
    editExperienceController = TextEditingController(text: myServices.sharedPreferences.getString("Seeker_experience"));
    editEducationController = TextEditingController(text: myServices.sharedPreferences.getString("Seeker_education"));
    editSkillsController = TextEditingController(text: myServices.sharedPreferences.getString("Seeker_skills"));
    super.onInit();
  }

  @override
  void dispose() {
    editAboutController.dispose();
    editLocationController.dispose();
    editPositionController.dispose();
    editEmailController.dispose();
    editPhoneController.dispose();
    editExperienceController.dispose();
    editEducationController.dispose();
    editSkillsController.dispose();
    super.dispose();
  }
}