import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class AdminHomePageBack {
  Crud crud;
  AdminHomePageBack(this.crud);
  getJobs(var token, String language) async {
    var response = await crud.postAndGetData(
        AppLinks.jobs + "?lang=" + language,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  getFreelancerInfo(var token, String language, String id) async {
    var response = await crud.postAndGetData(
        AppLinks.profile + id + "?lang=" + language,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
