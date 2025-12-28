import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetEmployerInterviewsModel {

  Crud crud ;
  GetEmployerInterviewsModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.getEmployerInterviews,data);
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}