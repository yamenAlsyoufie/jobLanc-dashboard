import 'package:projectoneuniversity/core/class/crud.dart';

class WalletBack {
  Crud crud;
  WalletBack(this.crud);
  searchUser(String token, String link, Map data) async {
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

  chargeWallet(String token, Map data,String link) async {
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

}
