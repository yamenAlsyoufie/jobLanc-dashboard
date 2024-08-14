

import 'package:projectoneuniversity/core/class/crud.dart';

class AddReviewBack {
  Crud crud;
  AddReviewBack(this.crud);
  postData(
    Map data,
    var token,
  ) async {
    var response = await crud.postAndGetData(AppLinks.review, data,
        {'Authorization': 'Bearer $token'}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }

  getData(Map data, var token, String id) async {
    var response = await crud.postAndGetData(AppLinks.review + "?user_id=" + id,
        data, {'Authorization': 'Bearer $token'}, null, false, false, null);
    return response.fold((l) => l, (r) => r);
  }

  postRate(String token, Map data) async {
    var response = await crud.postAndGetData(AppLinks.rate, data,
        {'Authorization': 'Bearer $token'}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
}
