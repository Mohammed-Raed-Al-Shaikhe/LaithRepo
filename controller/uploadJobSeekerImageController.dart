import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/class/requestStatus.dart';
import '../core/constant/routesNames.dart';
import '../core/services/myService.dart';
import '../data/auth/jobSeekerData/uploadJobSeekerImageModel.dart';

class UploadJobSeekerImageController extends GetxController {

  final UploadJobSeekerImageModel uploadImageModel = UploadJobSeekerImageModel(Get.find());
  final ImagePicker _picker = ImagePicker();
  var selectedImage = Rxn<File>();
  var requestStatus = RequestStatus.none.obs;
  MyServices myServices = Get.find();


  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }


  Future<void> uploadImage() async {
    if (selectedImage.value == null) {
      Get.snackbar("Error", "Please select an image first");
      return;
    }
    requestStatus.value = RequestStatus.loading;

    var response = await uploadImageModel.uploadImage(
      selectedImage.value!,
      myServices.sharedPreferences.getInt("Seeker_id").toString(),
    );

    if (response['status'] == "success") {
      requestStatus.value = RequestStatus.success;
      Get.snackbar("Success", "Image uploaded successfully");
      Get.offNamed(AppRoutes.jobSeekerProfileInfoPage);
    } else {
      requestStatus.value = RequestStatus.failure;
      Get.snackbar("Error", response['message'] ?? "Image upload failed");
    }
  }
}