import '../../../core/class/crud.dart';
import '../../../core/constant/apiLinks.dart';

class JobSeekerLoginModel {

  Crud crud ;
  JobSeekerLoginModel(this.crud);

  getData(Map data) async {
    var response = await crud.postData(ApiLinks.jobSeekerLogin, data);
    print(response);
    return response.fold((l) => l, (r) => r);//fold is a function that says : if it is left , do this . If it is right , do that .
  }
}