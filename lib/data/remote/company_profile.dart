import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class CompanyAccount {
  Crud crud;
  CompanyAccount(this.crud);

  getData(var token, String id, String lang) async {
    var response = await crud.postAndGetData(
        AppLinks.profile + id + "?lang=" + lang,
        {},
        {
          'Authorization': 'Bearer $token',
        },
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
