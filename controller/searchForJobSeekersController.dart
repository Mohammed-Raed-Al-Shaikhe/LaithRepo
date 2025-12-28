import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';
import 'package:job_flix_application/data/auth/employerData/getJobSeekersByFieldModel.dart';
import '../core/constant/routesNames.dart';
import '../core/functions/handlingData.dart';

abstract class SearchForJobSeekersController extends GetxController {
  goToFilters();
  getJobSeekersByField(String field);
}

class SearchForJobSeekersControllerImpl extends SearchForJobSeekersController {

  var selectedIndex = Rxn<int>();
  GetJobSeekersByFieldModel getJobSeekersByFieldModel = GetJobSeekersByFieldModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  var jobSeekers = [].obs;


  @override
  goToFilters() {
    Get.toNamed(AppRoutes.jobSeekerFiltersScreen);
  }

  void selectJobType(int index,String field) {
    selectedIndex.value = index;
    getJobSeekersByField(field);
  }

  @override
  Future<void> getJobSeekersByField(String field) async {
    requestStatus = RequestStatus.loading;
    var response = await getJobSeekersByFieldModel.getData({"field" : field});
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success){
      if(response['status']=='success'){
        jobSeekers.assignAll(response['data']);
        Get.toNamed(AppRoutes.jobSeekersByField,arguments: {'jobSeekers' : jobSeekers,'field' : field});
      }else{
        Get.snackbar('Error', "No job Seekers found for $field",backgroundColor: Colors.red,colorText: Colors.white);
      }
    }
  }

  String encodeFieldName(String field) {
    return field.replaceAll('&', '&amp;');
  }

}