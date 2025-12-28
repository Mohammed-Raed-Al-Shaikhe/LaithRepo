import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetJobSeekersByFieldModel {

  Crud crud ;
  GetJobSeekersByFieldModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.getJobSeekersByField,data);
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}