import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/data/auth/employerData/editEmployerProfileModel.dart';
import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';

abstract class EditEmployerProfilePage extends GetxController{
  saveChanges();
}

class EditEmployerProfilePageImpl extends EditEmployerProfilePage{

  late TextEditingController editAboutController;
  late TextEditingController editLocationController;
  late TextEditingController editEmailController;
  late TextEditingController editPhoneController;
  MyServices myServices = Get.find();
  EditEmployerProfileModel editEmployerProfileModel = EditEmployerProfileModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;


  @override
  saveChanges() async{
    requestStatus = RequestStatus.loading;
    var response = await editEmployerProfileModel.getData(
        {
          "id" : myServices.sharedPreferences.getInt("Employer_id").toString(),
          "aboutus" : editAboutController.text,
          "location" : editLocationController.text,
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
    editAboutController = TextEditingController(text: myServices.sharedPreferences.getString("Employer_about"));
    editLocationController = TextEditingController(text: myServices.sharedPreferences.getString("Employer_location"));
    editEmailController = TextEditingController(text: myServices.sharedPreferences.getString("Employer_email"));
    editPhoneController = TextEditingController(text: myServices.sharedPreferences.getString("Employer_phone"));
    super.onInit();
  }

  @override
  void dispose() {
    editAboutController.dispose();
    editLocationController.dispose();
    editEmailController.dispose();
    editPhoneController.dispose();
    super.dispose();
  }
}