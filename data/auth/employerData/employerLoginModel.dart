import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class EmployerLoginModel {

  Crud crud ;
  EmployerLoginModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.employerLogin, data);
    return response.fold((l) => l, (r) => r);
  }
}