import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/routesNames.dart';
import '../services/myService.dart';

class JobSeekerProfileMiddleWare extends GetMiddleware{

  @override
  int? get priority => 1;
  final MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? profileInfoDone = myServices.sharedPreferences.getString("profileInfo_${myServices.sharedPreferences.getInt("Seeker_id")}");
    if (profileInfoDone == 'Done') {
      return const RouteSettings(name: AppRoutes.jobSeekerProfilePage);
    }
    return null;
  }
}


