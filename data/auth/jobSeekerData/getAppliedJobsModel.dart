import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetAppliedJobsModel {

  Crud crud ;
  GetAppliedJobsModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.getAppliedJobs, data);
    return response.fold((l) => l, (r) => r);
  }
}