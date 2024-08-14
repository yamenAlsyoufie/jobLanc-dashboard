import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class SkillBack {
  Crud crud;
  SkillBack(this.crud);
  getSkillsTags(String token, String link, Map data) async {
    var response = await crud.postAndGetData(
        link,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  addSkillTag(String token, Map data,String link) async {
    var response = await crud.postAndGetData(
        link,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  deleteSkill(String token, String id) async {
    var response = await crud.deleteData(
      "${AppLinks.skills}/$id",
      {},
      {'Authorization': 'Bearer $token', 'accept': 'application/json'},
    );
    return response.fold((l) => l, (r) => r);
  }
}
