import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetJobApplicationsModel {

  Crud crud ;
  GetJobApplicationsModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.getJobApplications, data);
    return response.fold((l) => l, (r) => r);
  }
}