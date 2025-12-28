import 'package:get/get.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';
import 'package:job_flix_application/core/functions/handlingData.dart';
import '../core/constant/routesNames.dart';
import '../data/auth/employerData/searchForJobSeekersModel.dart';

class JobSeekerFiltersController extends GetxController {
  var selectedField = "".obs;
  var selectedLocation = "".obs;
  var minExperience = 0.obs;
  var maxExperience = 0.obs;
  var matchedJobSeekers = [].obs;
  SearchForJobSeekersModel searchForJobseekersModel = SearchForJobSeekersModel(Get.find());
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

  search() async {
    requestStatus = RequestStatus.loading;
    update();
    try {
      var response = await searchForJobseekersModel.getData({
        "seekerField": selectedField.value,
        "seekerLocation": selectedLocation.value,
        "minExperience" : minExperience.value.toString(),
        "maxExperience" : maxExperience.value.toString()
      });
      requestStatus = handlingData(response);
      if (requestStatus == RequestStatus.success) {
        if (response['status'] == "success") {
          matchedJobSeekers.assignAll(response['data']);
          Get.toNamed(AppRoutes.viewJobSeekersSearchResults, arguments: {'matchedJobSeekers': matchedJobSeekers});
        } else {
          //matchedJobSeekers.clear();
          Get.toNamed(AppRoutes.viewJobSeekersSearchResults, arguments: {'matchedJobSeekers': matchedJobSeekers});
        }
      } else {
        matchedJobSeekers.clear();
        Get.toNamed(AppRoutes.viewJobSeekersSearchResults, arguments: {'matchedJobSeekers': matchedJobSeekers});
      }
    } catch (e) {
      matchedJobSeekers.clear();
      requestStatus = RequestStatus.failure;
      Get.toNamed(AppRoutes.viewJobSeekersSearchResults, arguments: {'matchedJobSeekers': matchedJobSeekers});
    }
    update();
  }

  void resetFilters() {
    selectedField.value = "";
    selectedLocation.value = "";
    minExperience.value = 0;
    maxExperience.value = 0;
  }

}