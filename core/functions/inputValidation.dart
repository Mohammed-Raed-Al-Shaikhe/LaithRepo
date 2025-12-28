import 'package:get/get.dart';

inputValidation(String value, int min, int max, String type){
  if(type == "username") {
    if (!(GetUtils.isUsername(value))) {
      return "username is not valid";
    }
  }

  if(type == "email"){
    if(!(GetUtils.isEmail(value))){
      return "email is not valid";
    }
  }

  if(type == "phone"){
    if(!(GetUtils.isPhoneNumber(value))){
      return "phone number is not valid";
    }
  }

  if(value.isEmpty){
    return "value can't be empty";
  }

  if(value.length < min){
    return "value can't be less than $min";
  }

  if(value.length > max){
    return "value can't be more than $max";
  }

}