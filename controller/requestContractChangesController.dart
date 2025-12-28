import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../data/auth/jobSeekerData/requestContractChangesModel.dart';

class RequestContractChangesController extends GetxController{
  TextEditingController changesController = TextEditingController();
  RequestContractChangesModel requestContractChangesModel = RequestContractChangesModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;

  requestChanges(int contractId) async {
    requestStatus = RequestStatus.loading;
    var response = await requestContractChangesModel.requestChanges({
      "contractId" : contractId.toString(),
      "changes" : changesController.text,
    });
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success){
      if(response['status'] == 'success'){
        Get.snackbar("Success", "Contract changes requested successfully");
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


