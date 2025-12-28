import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/routesNames.dart';
import '../services/myService.dart';

class MyMiddleWare extends GetMiddleware{

  @override
  int? get priority => 1;

  final MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? userRole = myServices.sharedPreferences.getString("role");
    if (userRole == 'Employer') {
      return const RouteSettings(name: AppRoutes.employerSignUp);
    }else if(userRole== 'JobSeeker'){
      return const RouteSettings(name: AppRoutes.jobSeekerSignUp);
    }
    return null;
  }
}


