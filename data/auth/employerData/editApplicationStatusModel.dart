import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class UpdateApplicationStatusModel {
  Crud crud;
  UpdateApplicationStatusModel(this.crud);

  updateStatus(Map data) async {
    var response = await crud.postData(ApiLinks.editApplicationStatus, data);
    return response.fold((l) => l, (r) => r);
  }
}