import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class UploadEmployerImageModel {

  Crud crud;
  UploadEmployerImageModel(this.crud);

  Future<Map<String, dynamic>> uploadImage(File file, String userId) async {
    var uri = Uri.parse(ApiLinks.uploadEmployerImage);
    var request = http.MultipartRequest("POST", uri);

    request.fields['user_id'] = userId;
    request.files.add(await http.MultipartFile.fromPath("imagename", file.path));

    var response = await request.send();
    var responseBody = await response.stream.bytesToString();

    print("📡 Raw Response: $responseBody");

    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        return jsonDecode(responseBody);
      } catch (e) {
        return {"status": "failure", "message": "Invalid JSON"};
      }
    } else {
      return {"status": "failure", "message": "Server error"};
    }
  }
}