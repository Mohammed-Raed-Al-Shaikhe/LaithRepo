import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/routesNames.dart';

abstract class ResetPasswordController extends GetxController{
  reset();
}

class ResetPasswordControllerImpl extends ResetPasswordController{

  late final TextEditingController newPasswordController ;
  late final TextEditingController confirmPasswordController ;
  late final GlobalKey<FormState> formKey4 ;

  @override
  reset() {
    var formData = formKey4.currentState;
    if(formData!.validate()){
      //Get.offNamed(AppRoutes.successResetPassword);
    }else{
      print("not valid");
    }
  }


  @override
  void onInit() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey4 = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

}