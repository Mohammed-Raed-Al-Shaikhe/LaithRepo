import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routesNames.dart';

abstract class ForgetPasswordController extends GetxController{
  checkEmail();
  goToVerifyCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController{

  late final TextEditingController emailController ;
  late final GlobalKey<FormState> formKey3;

  @override
  checkEmail() {}

  @override
  goToVerifyCode() {
    var formData = formKey3.currentState;
    if(formData!.validate()){
      //Get.offNamed(AppRoutes.verifyCode);
    }else{
      print("not valid");
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    formKey3 = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

}