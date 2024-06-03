import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class LoginBack {
  Crud crud;
  LoginBack(this.crud);
  login(Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.logIn, data, {}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
}
