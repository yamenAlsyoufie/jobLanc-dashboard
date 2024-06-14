

import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class ReviewBack {
  Crud crud;
  ReviewBack(this.crud);

  getData(Map data, var token, String id) async {
    var response = await crud.postAndGetData(AppLinks.reviews + "?user_id=" + id,
        data, {'Authorization': 'Bearer $token'}, null, false, false, null);
    return response.fold((l) => l, (r) => r);
  }

}
