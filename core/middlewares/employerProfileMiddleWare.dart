import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/routesNames.dart';
import '../services/myService.dart';

class EmployerProfileMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  final MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    final employerId = myServices.sharedPreferences.getInt("Employer_id");
    if (employerId == null) return null;

    final profileInfoDone = myServices.sharedPreferences.getString("profileInfo_$employerId");

    if (profileInfoDone == 'Done') {
      return const RouteSettings(name: AppRoutes.employerProfilePage);
    }
    return null;
  }
}


