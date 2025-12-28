import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetEmployerContractsModel {

  Crud crud ;
  GetEmployerContractsModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.employerContracts, data);
    return response.fold((l) => l, (r) => r);
  }
}