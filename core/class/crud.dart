import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';
import '../functions/checkInternet.dart';
import 'package:http/http.dart' as http;

class Crud {

  Future <Either<RequestStatus,Map>> postData(String url,Map data) async {

    try{
      if(await checkInternet()){
        var response = await http.post(Uri.parse(url),body: data);
        print("response is ${response.body}");
        print("response status code is ${response.statusCode}");
        if(response.statusCode == 200 || response.statusCode == 201){
          Map responseBody = jsonDecode(response.body);
          return Right(responseBody);
        }else{
          return Left(RequestStatus.serverFailure);
        }
      }else{
        return Left(RequestStatus.offlineFailure);
      }
    }catch(e){
      print("error is $e");
      return Left(RequestStatus.serverFailure);
    }

  }
}