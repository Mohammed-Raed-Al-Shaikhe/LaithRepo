import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetJobSeekerInterviewsModel {

  Crud crud ;
  GetJobSeekerInterviewsModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.getJobSeekerInterviews,data);
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}