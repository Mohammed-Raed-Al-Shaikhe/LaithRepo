import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class CreateContractModel {

  Crud crud ;
  CreateContractModel(this.crud);

  createContract(Map data) async {
    var response = await crud.postData(ApiLinks.createContract,data);
    return response.fold((l) => l, (r) => r);
  }
}