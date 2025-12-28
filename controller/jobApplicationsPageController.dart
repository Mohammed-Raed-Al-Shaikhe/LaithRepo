import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/controller/employerHomePageController.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';
import 'package:job_flix_application/core/functions/handlingData.dart';
import '../data/auth/employerData/editApplicationStatusModel.dart';

abstract class JobApplicationsController extends GetxController{
  updateStatus(String id, String status);
}

class JobApplicationControllerImpl extends JobApplicationsController{
  EmployerHomePageControllerImpl employerHomePageController = Get.find<EmployerHomePageControllerImpl>();
  UpdateApplicationStatusModel updateApplicationStatusModel = UpdateApplicationStatusModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;

  @override
  updateStatus(String id, String status) async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await updateApplicationStatusModel.updateStatus({
      "applicationId" : id,
      "newStatus" : status
    });
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success){
      if(response['status'] == "success"){
       int index =  employerHomePageController.jobApplications.indexWhere((element) => element['application_id'].toString() == id);
       if(index != -1){
         final updated = Map<String, dynamic>.from(employerHomePageController.jobApplications[index]);
         updated['application_status'] = status;
         employerHomePageController.jobApplications[index] = updated;
       }
       Get.snackbar("Success", "Status updated successfully");
      }else{
        Get.snackbar("Error", "Something went wrong");
      }
    }
    update();
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "accepted":
        return Colors.green;
      case "rejected":
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  IconData getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case "accepted":
        return Icons.check_circle;
      case "rejected":
        return Icons.cancel;
      default:
        return Icons.access_time;
    }
  }

}