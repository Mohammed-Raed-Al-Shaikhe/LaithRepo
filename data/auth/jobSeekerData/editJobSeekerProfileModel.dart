import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class EditJobSeekerProfileModel {

  Crud crud ;
  EditJobSeekerProfileModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.editJobSeekerProfile, data);
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}