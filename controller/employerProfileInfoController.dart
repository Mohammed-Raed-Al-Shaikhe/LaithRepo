import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/constant/routesNames.dart';
import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';
import '../data/auth/employerData/employerProfileInfoModel.dart';

abstract class EmployerProfileInfoController extends GetxController {
  saveInfo();
}

class EmployerProfileInfoControllerImpl extends EmployerProfileInfoController {

  late TextEditingController aboutController;
  late TextEditingController locationController;
  late GlobalKey<FormState> profileFormKey;
  RequestStatus requestStatus = RequestStatus.none;
  EmployerProfileInfoModel employerProfileInfoModel = EmployerProfileInfoModel(Get.find());
  MyServices myServices = Get.find();

  @override
  saveInfo() async {
    if (profileFormKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      var response = await employerProfileInfoModel.getData(
        {
          "id" : myServices.sharedPreferences.getInt("Employer_id").toString(),
          "aboutus" : aboutController.text,
          "location" : locationController.text,
        },
      );
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success){
        if(response['status'] == 'success'){
          // update shared pref with new values
          await myServices.sharedPreferences.setString("Employer_about", aboutController.text);
          await myServices.sharedPreferences.setString("Employer_location", locationController.text);
          await myServices.sharedPreferences.setString("profileInfo_${myServices.sharedPreferences.getInt("Employer_id")}", "Done");
          Get.offNamed(AppRoutes.employerProfilePage);
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
    super.onInit();
  }

  @override
  void dispose() {
    aboutController.dispose();
    locationController.dispose();
    super.dispose();
  }


}