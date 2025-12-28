import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetJobSeekerContractsModel {

  Crud crud ;
  GetJobSeekerContractsModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.jobSeekerContracts, data);
    return response.fold((l) => l, (r) => r);
  }
}