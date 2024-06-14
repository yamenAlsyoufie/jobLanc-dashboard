import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class Statisticback {
  Crud crud;
  Statisticback(this.crud);
  getStatistics(var token, String lang, Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.IP+"?lang="+lang,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
