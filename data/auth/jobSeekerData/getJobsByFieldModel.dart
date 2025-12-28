import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetJobsByFieldModel {

  Crud crud ;
  GetJobsByFieldModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.getJobsByField,data);
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}