import 'package:get/get.dart';
import '../core/constant/routesNames.dart';

abstract class JobSeekerProfileController extends GetxController{
  editProfile();
  goToSettings();
}

class JobSeekerProfileControllerImpl extends JobSeekerProfileController{
  @override
  editProfile() {
    Get.toNamed(AppRoutes.editJobSeekerProfilePage);
  }

  @override
  goToSettings() {}
}