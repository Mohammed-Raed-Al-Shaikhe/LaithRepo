import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class EditEmployerProfileModel {

  Crud crud ;
  EditEmployerProfileModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.editEmployerProfile, data);
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}