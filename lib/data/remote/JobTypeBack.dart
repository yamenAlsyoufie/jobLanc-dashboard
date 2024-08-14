import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class JobTypeBack {
  Crud crud;
  JobTypeBack(this.crud);
  addJobType(String token, Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.jobExperience,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  getJobTypes(String token, String lang) async {
    var response = await crud.postAndGetData(
        AppLinks.jobExperience + "?lang=" + lang,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
