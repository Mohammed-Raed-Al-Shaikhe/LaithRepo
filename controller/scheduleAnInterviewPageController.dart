import 'package:get/get.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';
import 'package:job_flix_application/data/auth/employerData/scheduleAnInterviewModel.dart';
import '../core/functions/handlingData.dart';
import 'employerHomePageController.dart';
import 'jobSeekerHomePageController.dart';

abstract class ScheduleAnInterviewController extends GetxController{
  scheduleAnInterView();
}

class ScheduleAnInterviewControllerImpl extends ScheduleAnInterviewController {

  ScheduleAnInterviewModel scheduleAnInterviewModel = ScheduleAnInterviewModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  String seekerId = "";
  String employerId = "";
  String jobId = "";
  String interviewDate = "";
  String interviewTime = "";

  @override
  scheduleAnInterView() async {
    requestStatus = RequestStatus.loading;
    update();

    var response = await scheduleAnInterviewModel.schedule({
      "seekerId": seekerId,
      "employerId": employerId,
      "jobId": jobId,
      "interviewDate": interviewDate,
      "interviewTime": interviewTime,
    });

    requestStatus = handlingData(response);

    if (requestStatus == RequestStatus.success) {
      if (response["status"] == "success") {
        Get.snackbar("Success", "Interview scheduled successfully");
        Get.find<EmployerHomePageControllerImpl>().getInterviews();// to update employer interviews list
        Get.find<JobSeekerHomePageControllerImpl>().getInterviews();// to update job seeker the interviews list
      } else {
        Get.snackbar("Error", "Scheduling failed");
      }
    }

    update();
  }
}


