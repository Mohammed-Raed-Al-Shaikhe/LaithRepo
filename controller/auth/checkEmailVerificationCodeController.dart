import 'package:get/get.dart';
import '../../core/constant/routesNames.dart';

abstract class CheckEmailVerificationCodeController extends GetxController{
  verifyCode();
  goToSuccessSignUp();
}

class CheckEmailVerificationCodeControllerImpl extends CheckEmailVerificationCodeController{

  late String verificationCode ;

  @override
  verifyCode() {

  }

  @override
  goToSuccessSignUp() {
    //Get.offNamed(AppRoutes.successSignUp);
  }

}