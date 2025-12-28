import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../data/auth/jobSeekerData/rejectContractModel.dart';

class RejectContractController extends GetxController{
  RejectContractModel rejectContractModel = RejectContractModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;

  reject(int contractId) async {
    requestStatus = RequestStatus.loading;
    var response = await rejectContractModel.rejectContract({
      "contractId" : contractId.toString(),
    });
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success){
      if(response['status'] == 'success'){
        Get.snackbar("Success", "Contract rejected successfully");
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


