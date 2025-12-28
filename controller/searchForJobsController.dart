import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/functions/handlingData.dart';
import 'package:job_flix_application/data/auth/jobSeekerData/getJobsByFieldModel.dart';
import '../core/class/requestStatus.dart';
import '../core/constant/routesNames.dart';

abstract class SearchForJobsController extends GetxController {
  goToFilters();
  getJobsByField(String field);
}

class SearchForJobsControllerImpl extends SearchForJobsController {

  var selectedIndex = Rxn<int>();
  GetJobsByFieldModel getJobsByFieldModel = GetJobsByFieldModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  var jobs = [].obs;


  @override
  goToFilters() {
    Get.toNamed(AppRoutes.jobFiltersScreen);
  }

  void selectJobType(int index,String field) async{
    selectedIndex.value = index;
    await getJobsByField(field);
  }

  @override
  Future<void> getJobsByField(String field) async{
    requestStatus = RequestStatus.loading;
    var response = await getJobsByFieldModel.getData({"field" : field});
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success){
      if(response['status']=='success'){
        jobs.assignAll(response['data']);
        Get.toNamed(AppRoutes.jobsByField,arguments: {'jobs' : jobs,'field' : field});
      }else{
        Get.snackbar('Error', "No jobs found for $field",backgroundColor: Colors.red,colorText: Colors.white);
      }
    }
  }

  String encodeFieldName(String field) {
    return field.replaceAll('&', '&amp;');
  }

}