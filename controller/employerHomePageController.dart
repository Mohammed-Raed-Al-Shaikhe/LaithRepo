import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/data/auth/employerData/availableJobSeekersModel.dart';
import 'package:job_flix_application/data/auth/employerData/getEmployerInterviwesModel.dart';
import 'package:job_flix_application/data/auth/employerData/getJobApplicationsModel.dart';
import '../core/class/requestStatus.dart';
import '../core/constant/routesNames.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';
import '../data/auth/employerData/getEmployerContractsModel.dart';

abstract class EmployerHomePageController extends GetxController{
  goToSearchPage();// done
  goToEmployerProfile();// done
  goToEmployerHome();// done
  goToEmployerContracts();// done
  getEmployerContracts();// done
  goToEmployerPayments();// done
  goToPostingJobs();// done
  getJobApplications();// done
  goToJobApplications();// done
  getInterviews();// done
  goToInterviews();// done
}

class EmployerHomePageControllerImpl extends EmployerHomePageController{

  MyServices myServices = Get.find();
  var firstname = "".obs;
  var lastname = "".obs;
  List availableJobSeekers = [].obs;
  GetJobApplicationsModel getJobApplicationsModel = GetJobApplicationsModel(Get.find());
  AvailableJobSeekersModel availableJobSeekersModel = AvailableJobSeekersModel(Get.find());
  GetEmployerInterviewsModel getEmployerInterviewsModel = GetEmployerInterviewsModel(Get.find());
  GetEmployerContractsModel getEmployerContractsModel = GetEmployerContractsModel(Get.find());
  RxList<dynamic> jobApplications = <dynamic>[].obs;
  RxList<dynamic> interviews = <dynamic>[].obs;
  RxList<dynamic> contracts = <dynamic>[].obs;
  RequestStatus requestStatus = RequestStatus.none;
  int applicationsCount = 0;
  int interviewsCount = 0;

  initialData() {
    firstname.value = myServices.sharedPreferences.getString("Employer_firstName")??"??";
    lastname.value = myServices.sharedPreferences.getString("Employer_lastName")??"??";
  }

  @override
  getJobApplications() async {
    requestStatus = RequestStatus.loading;
    var response = await getJobApplicationsModel.getData({
      "employerId": myServices.sharedPreferences.getInt("Employer_id").toString(),
    });
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        applicationsCount = int.tryParse(response['count'].toString())??0;
        jobApplications.assignAll(response['data']);
        print("Job Applications Loaded: ${jobApplications.length}");
      } else {
        print("No Applied Jobs");
      }
    }
    update();
  }

  getAvailableJobSeekers() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await availableJobSeekersModel.getData();
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        availableJobSeekers.assignAll(response['data']);
      } else {
        availableJobSeekers.clear();
        if (!Get.isDialogOpen! && Get.context != null) {
          showDialog(
            context: Get.context!,
            builder: (context) {
              return AlertDialog(
                content: Text("No Available JobSeekers"),
              );
            },
          );
        }
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  @override
  getInterviews() async{
    requestStatus = RequestStatus.loading;
    var response = await getEmployerInterviewsModel.getData({
      "employerId": myServices.sharedPreferences.getInt("Employer_id").toString(),
    });
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        interviewsCount = int.tryParse(response['count'].toString())??0;
        interviews.assignAll(response['data']);
        print("Interviews Loaded: ${interviews.length}");
      } else {
        print("No Interviews");
      }
    }
    update();
  }

  @override
  getEmployerContracts() async {
    requestStatus = RequestStatus.loading;
    var response = await getEmployerContractsModel.getData({
      "employerId" : myServices.sharedPreferences.getInt("Employer_id").toString(),
    });
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        contracts.assignAll(response['data']);
        print("Employer Contracts Loaded: ${contracts.length}");
      }
    }else{
      Get.defaultDialog(
        title: "Error",
        middleText: "Something went wrong",
      );
    }
    update();
    }

  @override
  goToJobApplications() {
    Get.toNamed(AppRoutes.jobApplications);
  }

  @override
  goToInterviews() {
    Get.toNamed(AppRoutes.employerInterviews);
  }

  @override
  goToPostingJobs() {
    Get.toNamed(AppRoutes.postingJobs);
  }

  @override
  goToEmployerHome() {
    Get.toNamed(AppRoutes.employerHomePage);
  }

  @override
  goToEmployerContracts() {
    Get.toNamed(AppRoutes.employerContracts);
  }

  @override
  goToEmployerPayments() {
    Get.toNamed(AppRoutes.payment);
  }

  @override
  goToEmployerProfile() {
    Get.toNamed(AppRoutes.employerProfileWelcomingPage);
  }

  @override
  goToSearchPage() {
    Get.toNamed(AppRoutes.searchForJobSeekers);
  }

  @override
  void onInit() {
    initialData();
    getJobApplications();
    getInterviews();
    getAvailableJobSeekers();
    super.onInit();
  }

}