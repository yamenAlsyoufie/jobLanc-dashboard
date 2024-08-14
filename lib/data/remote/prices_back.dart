import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class PricesBack {
  Crud crud;
  PricesBack(this.crud);
  getPrices(String token, String lang) async {
    var response = await crud.postAndGetData(
        AppLinks.price+"?lang="+lang,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
