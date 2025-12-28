import 'package:get/get.dart';

class AppliedJobsController extends GetxController {
  var selectedTab = 0.obs; // 0=Pending, 1=Accepted, 2=Rejected

  void changeTab(int index) {
    selectedTab.value = index;
  }
}