import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class GetJobPostsModel {

  Crud crud ;
  GetJobPostsModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.getJobPosts, data);
    return response.fold((l) => l, (r) => r);
  }
}