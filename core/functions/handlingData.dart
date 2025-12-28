import '../class/requestStatus.dart';

handlingData(response){
  if(response is RequestStatus){
    return response;
  }else{
    return RequestStatus.success;
  }
}