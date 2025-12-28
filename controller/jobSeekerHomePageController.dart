import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/data/auth/jobSeekerData/getAppliedJobsModel.dart';
import 'package:job_flix_application/data/auth/jobSeekerData/getJobSeekerInterviewsModel.dart';
import 'package:job_flix_application/data/auth/jobSeekerData/recommendedJobPostsModel.dart';
import '../core/class/requestStatus.dart';
import '../core/constant/routesNames.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';
import '../data/auth/jobSeekerData/getJobSeekerContractsModel.dart';
import '../data/auth/jobSeekerData/recentJobPostsModel.dart';
import 'package:html_unescape/html_unescape.dart';

abstract class JobSeekerHomePageController extends GetxController {
  goToSearchPage();// done
  goToJobSeekerProfile();// done
  goToJobSeekerHome();// done
  getJobSeekerContracts();// done
  goToJobSeekerContracts();// done
  goToJobSeekerMessages();
  getAppliedJobs();// done
  goToAppliedJobs();// done
  getInterviews();// done
  goToInterviews();// done
}

class JobSeekerHomePageControllerImpl extends JobSeekerHomePageController{
  MyServices myServices = Get.find();
  var firstname = "".obs;
  var lastname = "".obs;
  List recommendedJobs = <Map>[].obs;
  RxList<dynamic> interviews = <dynamic>[].obs;
  RxList<dynamic> contracts = <dynamic>[].obs;
  List recentJobs = [].obs;
  List appliedJobs = [].obs;
  var selectedStatus = 'All'.obs;
  RecommendedJobPostsModel recommendedJobPostsModel = RecommendedJobPostsModel(Get.find());
  RecentJobPostsModel recentJobPostsModel = RecentJobPostsModel(Get.find());
  GetAppliedJobsModel getAppliedJobsModel = GetAppliedJobsModel(Get.find());
  GetJobSeekerInterviewsModel getJobSeekerInterviewsModel = GetJobSeekerInterviewsModel(Get.find());
  GetJobSeekerContractsModel getJobSeekerContractsModel = GetJobSeekerContractsModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  late int appliedJobsCount;
  int interviewsCount = 0;
  bool hasLoaded = false;

  initialData() {
    firstname.value = myServices.sharedPreferences.getString("Seeker_firstName")??"??";
    lastname.value = myServices.sharedPreferences.getString("Seeker_lastName")??"??";
  }

  List get filteredAppliedJobs {
    if (selectedStatus.value == 'All') return appliedJobs;
    return appliedJobs.where((job) => job['application_status'] == selectedStatus.value).toList();
  }

  getRecommendedJobs() async {
    final field = myServices.sharedPreferences.getString("Seeker_field");
    if (field == null || field.isEmpty) {
      print("field is null or empty");
      return;
    }
    requestStatus = RequestStatus.loading;
    update();
    var response = await recommendedJobPostsModel.getData({"field": field});
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        final unescape = HtmlUnescape();
        final jobs = (response['data'] as List)
            .map((e) => e as Map<String, dynamic>)
            .map((job) {
          job['job_field'] = unescape.convert(job['job_field']);
          return job;
        })
            .where((job) => job['job_field'] == field)
            .toList();
        recommendedJobs.assignAll(jobs);
        print("Recommended Jobs Loaded: ${recommendedJobs.length}");
      } else {
        recommendedJobs.clear();
        if (!Get.isDialogOpen! && Get.context != null) {
          showDialog(
            context: Get.context!,
            builder: (context) {
              return AlertDialog(
                content: Text("No Recommended Jobs"),
              );
            },
          );
        }
        requestStatus = RequestStatus.failure;
      }
    }
    update();
  }

  getRecentJobs() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await recentJobPostsModel.getData();
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        recentJobs.assignAll(response['data']);
      } else {
        recommendedJobs.clear();
        if (!Get.isDialogOpen! && Get.context != null) {
          showDialog(
            context: Get.context!,
            builder: (context) {
              return AlertDialog(
                content: Text("No Recent Jobs"),
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
  getAppliedJobs() async{
    requestStatus = RequestStatus.loading;
    var response = await getAppliedJobsModel.getData({
      "seekerId": myServices.sharedPreferences.getInt("Seeker_id").toString(),
    });
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        appliedJobsCount = response['count'];
        appliedJobs.assignAll(response['data']);
        print("Applied Jobs Loaded: ${appliedJobs.length}");
      } else {
        print("No Applied Jobs");
      }
    }
    update();
  }

  @override
  getInterviews() async{
    requestStatus = RequestStatus.loading;
    var response = await getJobSeekerInterviewsModel.getData({
      "seekerId": myServices.sharedPreferences.getInt("Seeker_id").toString(),
    });
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        interviewsCount = int.tryParse(response['count'].toString())??0;
        interviews.assignAll(response['data']);
        print("JobSeeker Interviews Loaded: ${interviews.length}");
      } else {
        print("No Interviews");
      }
    }
    update();
  }

  @override
  getJobSeekerContracts() async {
    requestStatus = RequestStatus.loading;
    var response = await getJobSeekerContractsModel.getData({
      "seekerId" : myServices.sharedPreferences.getInt("Seeker_id").toString(),
    });
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        contracts.assignAll(response['data']);
        print("JobSeeker Contracts Loaded: ${contracts.length}");
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
  goToInterviews() {
    Get.toNamed(AppRoutes.jobSeekerInterviews);
  }

  @override
  goToAppliedJobs(){
    Get.toNamed(AppRoutes.appliedJobs);
  }

  @override
  goToJobSeekerHome() {
    Get.toNamed(AppRoutes.jobSeekerHomePage);
  }

  @override
  goToJobSeekerContracts() {
    Get.toNamed(AppRoutes.jobSeekerContracts);
  }

  @override
  goToJobSeekerMessages() {}

  @override
  goToJobSeekerProfile() {
    Get.toNamed(AppRoutes.jobSeekerProfileWelcomingPage);
  }

  @override
  goToSearchPage() {
    Get.toNamed(AppRoutes.searchForJobs);
  }

  @override
  void onInit() {
    if(!hasLoaded){
      hasLoaded = true;
      initialData();
      Future.delayed(Duration(microseconds: 500),() async {
        await getRecommendedJobs();
        await getRecentJobs();
        await getAppliedJobs();
        await getInterviews();
      });
    }
    super.onInit();
  }

}