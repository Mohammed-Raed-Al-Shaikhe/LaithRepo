import 'package:get/get.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';
import 'package:job_flix_application/core/functions/handlingData.dart';
import 'package:job_flix_application/data/auth/jobSeekerData/searchForJobsModel.dart';
import '../core/constant/routesNames.dart';

class JobFiltersController extends GetxController {
  var selectedField = "".obs;
  var selectedType = "".obs;
  var selectedLocation = "".obs;
  var minSalary = 0.obs;
  var maxSalary = 0.obs;
  var matchedJobs = [].obs;
  SearchForJobsModel searchForJobsModel = SearchForJobsModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;

  List<String> jobFields = [
    "Technology & IT",
    "Finance",
    "Management",
    "Marketing",
    "Sales",
    "Human Resources",
    "Customer Service",
    "Education",
    "Healthcare",
    "Engineering & Manufacturing",
    "Science",
    "Art & Design",
    "Media",
    "Law",
    "Agriculture, Food & Nutrition",
    "Restaurant",
    "Tourism, Hospitality & Transportation",
    "Real Estate & Construction",
    "Trades",
    "Free Business",
    "other"
  ];

  List<String> jobTypes = [
    "Full-time",
    "Part-time",
    "Contract",
    "Temporary",
    "Volunteer",
    "Apprenticeship",
  ];

  search() async {
    requestStatus = RequestStatus.loading;
    update();
    try {
      var response = await searchForJobsModel.getData({
        "jobField": selectedField.value,
        "jobType": selectedType.value,
        "jobLocation": selectedLocation.value,
        "minSalary": minSalary.value.toString(),
        "maxSalary": maxSalary.value.toString(),
      });
      requestStatus = handlingData(response);
      if (requestStatus == RequestStatus.success) {
        if (response['status'] == "success") {
          matchedJobs.assignAll(response['data']);
          Get.toNamed(AppRoutes.viewJobsSearchResults, arguments: {'matchedJobs': matchedJobs});
        } else {
          //matchedJobs.clear();
          Get.toNamed(AppRoutes.viewJobsSearchResults, arguments: {'matchedJobs': matchedJobs});
        }
      } else {
        matchedJobs.clear();
        Get.toNamed(AppRoutes.viewJobsSearchResults, arguments: {'matchedJobs': matchedJobs});
      }
    } catch (e) {
      matchedJobs.clear();
      requestStatus = RequestStatus.failure;
      Get.toNamed(AppRoutes.viewJobsSearchResults, arguments: {'matchedJobs': matchedJobs});
    }
    update();
  }

  void resetFilters() {
    selectedField.value = "";
    selectedType.value = "";
    selectedLocation.value = "";
    minSalary.value = 0;
    maxSalary.value = 0;
  }

}