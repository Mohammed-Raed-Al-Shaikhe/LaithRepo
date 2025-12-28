import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class ScheduleAnInterviewModel {

  Crud crud ;
  ScheduleAnInterviewModel(this.crud);

  schedule(Map data) async {
    var response = await crud.postData(ApiLinks.scheduleAnInterview, data);
    return response.fold((l) => l, (r) => r);
  }
}