import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../../core/constant/apiLinks.dart';

class ApplyJobModel {
  final Dio dio;

  ApplyJobModel(this.dio);

  Future<Map<String, dynamic>> apply({
    required String seekerId,
    required String jobId,
    required String coverLetter,
    File? cvFile,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "seekerId": seekerId,
        "jobId": jobId,
        "coverLetter": coverLetter,
        if (cvFile != null)
          "cv": await MultipartFile.fromFile(cvFile.path,
              filename: cvFile.path.split('/').last),
      });

      final response = await dio.post(ApiLinks.applyJob, data: formData);
      print("==================== raw response ====================");
      print(response.data);
      if(response.data is String){
        return jsonDecode(response.data);
      }
      return response.data;
    } catch (e) {
      return {
        "success": false,
        "message": e.toString(),
      };
    }
  }
}