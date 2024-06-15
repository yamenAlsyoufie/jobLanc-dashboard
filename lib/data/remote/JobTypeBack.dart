import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class JobTypeBack {
  Crud crud;
  JobTypeBack(this.crud);
  addJobType(String token,Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.jobType, data, {}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
  getJobTypes(String token ) async {
    var response = await crud.postAndGetData(
        AppLinks.jobType,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
