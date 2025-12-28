import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class AvailableJobSeekersModel {

  Crud crud ;
  AvailableJobSeekersModel(this.crud);

  getData() async {
    var response = await crud.postData(ApiLinks.getAvailableJobSeekers,{});
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}