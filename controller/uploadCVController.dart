import 'dart:io';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../../../core/class/requestStatus.dart';
import '../../../core/services/myService.dart';
import '../data/auth/jobSeekerData/uploadCVModel.dart';

class UploadCVController extends GetxController {
  final UploadCVModel uploadCVModel = UploadCVModel(Get.find());
  var selectedCV = Rxn<File>();
  var requestStatus = RequestStatus.none.obs;
  MyServices myServices = Get.find();

  Future<void> pickCV() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      selectedCV.value = File(result.files.single.path!);
    }
  }

  Future<void> uploadCV() async {
    if (selectedCV.value == null) {
      Get.snackbar("Error", "Please select a CV file first");
      return;
    }

    requestStatus.value = RequestStatus.loading;

    var response = await uploadCVModel.uploadCV({
      "user_id": myServices.sharedPreferences.getInt("Seeker_id"),
      "cvfile": selectedCV.value!.path.split('/').last,
    });

    if (response is Map && response['status'] == "success") {
      requestStatus.value = RequestStatus.success;
      Get.snackbar("Success", "CV uploaded successfully");
    } else {
      requestStatus.value = RequestStatus.failure;
      Get.snackbar("Error", "Failed to upload CV");
    }
  }
}