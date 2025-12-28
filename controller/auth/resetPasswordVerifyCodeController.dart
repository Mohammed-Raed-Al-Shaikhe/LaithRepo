import 'package:get/get.dart';
import '../../core/constant/routesNames.dart';

abstract class ResetPasswordVerifyCodeController extends GetxController{
  verifyCode();
  goToResetPassword();
}

class ResetPasswordVerifyCodeControllerImpl extends ResetPasswordVerifyCodeController{

  late String verificationCode ;

  @override
  verifyCode() {

  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoutes.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }

}