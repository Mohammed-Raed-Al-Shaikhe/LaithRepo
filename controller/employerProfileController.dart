import 'package:get/get.dart';
import 'package:job_flix_application/data/auth/employerData/getJobPostsModel.dart';
import '../core/class/requestStatus.dart';
import '../core/constant/routesNames.dart';
import '../core/functions/handlingData.dart';
import '../core/services/myService.dart';
import '../data/auth/employerData/deleteJobPostModel.dart';

abstract class EmployerProfileController extends GetxController{
  editProfile();//done
  goToSettings();
  goToMyPosts();//done
  deletePost(int postId);
}

class EmployerProfileControllerImpl extends EmployerProfileController{

  MyServices myServices = Get.find();
  GetJobPostsModel getJobPostsModel = GetJobPostsModel(Get.find());
  DeleteJobPostModel deleteJobPostModel = DeleteJobPostModel(Get.find());
  RequestStatus requestStatus = RequestStatus.none;
  var data = [].obs;

  @override
  editProfile() {
    Get.toNamed(AppRoutes.editEmployerProfilePage);
  }

  @override
  goToSettings() {}

  @override
  goToMyPosts() async {
    requestStatus = RequestStatus.loading;
    var employerId = myServices.sharedPreferences.getInt("Employer_id");
    var response = await getJobPostsModel.getData({
      "employerId" : employerId.toString(),
    });
    requestStatus = handlingData(response);
    if(requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        data.assignAll(response['data']);
        Get.toNamed(AppRoutes.employerPosts);
      }else{
        Get.toNamed(AppRoutes.noPostsPage);
      }
    }else{
      print("failed");
    }
    update();
    }

    @override
    deletePost(int postId) async {
      requestStatus = RequestStatus.loading;
      var response = await deleteJobPostModel.deletePost({
        "postId" : postId.toString(),
      });
      requestStatus = handlingData(response);
      if(requestStatus == RequestStatus.success) {
        if (response['status'] == 'success') {
          Get.snackbar("Success", "Post Deleted Successfully");
          goToMyPosts();
        }else{
          Get.snackbar("Error", "Something Went Wrong");
        }
      }else{
        print("failed");
      }
      update();
    }
  }
