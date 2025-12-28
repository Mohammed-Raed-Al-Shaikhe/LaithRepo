import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class SearchForJobSeekersModel {

  Crud crud ;
  SearchForJobSeekersModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.searchForJobSeekers, data);
    return response.fold((l) => l, (r) => r);
  }
}