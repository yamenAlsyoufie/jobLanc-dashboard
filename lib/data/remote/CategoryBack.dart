import 'dart:io';

import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class Categoryback {
  Crud crud;
  Categoryback(this.crud);
  getCategories(var token, String language) async {
    var response = await crud.postAndGetData(
        "${AppLinks.category}?lang=$language",
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
  postCategory(var token, File image) async {
    var response = await crud.postAndGetData(
        AppLinks.category,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        "image",
        true,
        true,
        image);
    return response.fold((l) => l, (r) => r);
  }
}
