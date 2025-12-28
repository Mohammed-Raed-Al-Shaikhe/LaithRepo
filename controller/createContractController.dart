import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:job_flix_application/data/auth/employerData/createContractModel.dart';
import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';

class CreateContractController extends GetxController {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final salaryController = TextEditingController();
  Rx<DateTime?> startDate = Rx<DateTime?>(null);
  Rx<DateTime?> endDate = Rx<DateTime?>(null);
  RxBool isLoading = false.obs;
  RequestStatus requestStatus = RequestStatus.none;
  CreateContractModel createContractModel = CreateContractModel(Get.find());
  MyServices myService = Get.find();

  Future<void> pickDate(bool isStart, BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      if (isStart) {
        startDate.value = date;
      } else {
        endDate.value = date;
      }
    }
  }

  Future<void> createContract() async {
    if (titleController.text.isEmpty || bodyController.text.isEmpty || salaryController.text.isEmpty || startDate.value == null || endDate.value == null) {
      Get.snackbar("Error", "Please fill all fields");
      return;
    }
    requestStatus = RequestStatus.loading;
    var response = await createContractModel.createContract({
      "employerId" : myService.sharedPreferences.getInt("Employer_id").toString(),
      "seekerId" : myService.sharedPreferences.getString("contract_seeker_id"),
      "jobId" : myService.sharedPreferences.getString("contract_job_id"),
      "contractTitle": titleController.text,
      "contractBody": bodyController.text,
      "contractSalary": salaryController.text,
      "contractStartDate" : startDate.value!.toLocal().toString().split(' ')[0],
      "contractEndDate" : endDate.value!.toLocal().toString().split(' ')[0],
      "companySignature" : "${myService.sharedPreferences.getString("Employer_businessName")} Company",
    });
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success){
      if (response['status'] == 'success') {
        Get.snackbar("Success", "Contract created successfully!");
        // refresh contracts page
      } else {
        Get.snackbar("Error", "Something went wrong");
      }
    }
  }
}