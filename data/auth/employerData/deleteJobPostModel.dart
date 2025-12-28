import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class DeleteJobPostModel {

  Crud crud ;
  DeleteJobPostModel(this.crud);

  deletePost(Map data) async {
    var response = await crud.postData(ApiLinks.deleteJobPost,data);
    return response.fold((l) => l, (r) => r);
  }
}