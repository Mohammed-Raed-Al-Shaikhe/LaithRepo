import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class PostJobModel {

  Crud crud ;
  PostJobModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.postJob, data);
    return response.fold((l) => l, (r) => r);
  }
}