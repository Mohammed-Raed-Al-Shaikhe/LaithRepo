import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../data/auth/jobSeekerData/signContractModel.dart';

class SignContractController extends GetxController{
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  SignContractModel signContractModel = SignContractModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;

  sign(int contractId) async {
    requestStatus = RequestStatus.loading;
    var response = await signContractModel.signContract({
      "contractId" : contractId.toString(),
      "jobSeekerSignature" : "${firstNameController.text} ${lastNameController.text}",
    });
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success){
      if(response['status'] == 'success'){
        Get.snackbar("Success", "Contract signed successfully");
      }
      else{
        Get.snackbar("Error", "Something went wrong");
      }
    }
    else{
      Get.snackbar("Error", "Something went wrong");
    }
    update();
  }
}


