import 'package:get/get.dart';
import 'package:job_flix_application/controller/postingJobsController.dart';

import '../core/class/requestStatus.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';
import '../data/auth/employerData/postJobModel.dart';

abstract class JobPostDetailsController extends GetxController{
  postJob();
}

class JobPostDetailsControllerImpl extends JobPostDetailsController{

  var selectedJobType = ''.obs;
  var salary = ''.obs;
  var selectedCurrency = ''.obs;
  var selectedPaymentMethod = ''.obs;
  var selectedJobField = ''.obs;
  var jobLocation = ''.obs;
  var showLocationField = false.obs;
  RequestStatus requestStatus = RequestStatus.none;
  PostJobModel postJobModel = PostJobModel(Get.find());
  PostingJobsControllerImpl postingJobsControllerImpl = Get.put(PostingJobsControllerImpl());
  MyServices myServices = Get.find();

  final jobTypes = [
    'Full-time',
    'Part-time',
    'Contract',
    'Temporary',
    'Volunteer',
    'Apprenticeship',
  ];
  final currencies = [
    'JOD , Jordan',
    'Riyal , KSA',
    'Dirham , UAE',
    'Dinar , Kuwait',
    'Riyal , Qatar',
    'Dinar , Bahrain',
    'Pound , Egypt',
    'Lira , Turkey',
    'Dollar , USA',
    'Euro , France',
    'Pound , UK',
    'Franc , Switzerland',
    'Yen , Japan',
    'Yuan , China',
    'Rupee , India',
    'Taka , Bangladesh',
    'Ringgit , Malaysia',
    'Rupiah , Indonesia',
    'Rand , South Africa',
    'Naira , Nigeria',
    'Real , Brazil',
    'Peso , Mexico',
  ];

  final paymentMethods = [
    'Per Month',
    'Per Hour',
    'Full Time Salary'
  ];

  final jobFields = [
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

  @override
  postJob() async{
    if(selectedJobType.value.isEmpty || salary.value.isEmpty || selectedCurrency.value.isEmpty || selectedPaymentMethod.value.isEmpty || selectedJobField.value.isEmpty || jobLocation.value.isEmpty) {
      Get.snackbar("Error", "Please fill all the fields");
      return;
    }
    requestStatus = RequestStatus.loading;
    var response = await postJobModel.getData({
      "employerId" : myServices.sharedPreferences.getInt("Employer_id")?.toString(),
      "jobTitle" : postingJobsControllerImpl.jobTitle.text,
      "jobDescription" : postingJobsControllerImpl.jobDescription.text,
      "jobRequirements" : postingJobsControllerImpl.jobRequirements.text,
      "jobField" : selectedJobField.value,
      "jobType" : selectedJobType.value,
      "jobLocation" : jobLocation.value,
      "jobSalary" : salary.value,
      "jobSalaryCurrency" : selectedCurrency.value,
      "jobOwner" : myServices.sharedPreferences.getString("Employer_businessName"),
    });
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success) {
      if(response['status'] == 'success') {
        Get.snackbar("Posted Successfully",
            "Your Job Post Has Been Posted Successfully");
      }
    }else{
      Get.snackbar("Error", "Something Went Wrong");
      requestStatus = RequestStatus.failure;
    }
    update();
  }

}