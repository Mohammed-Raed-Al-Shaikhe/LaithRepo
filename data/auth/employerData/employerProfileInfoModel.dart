import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class EmployerProfileInfoModel {

  Crud crud ;
  EmployerProfileInfoModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.employerProfileInfo, data);
    return response.fold((l) => l, (r) => r);
  }
}