import 'dart:io';

import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/constants/links.dart';

class ReportsBack {
  Crud crud;
  ReportsBack(this.crud);
  getReports(var token,) async {
    var response = await crud.postAndGetData(
        AppLinks.reports,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
  sendReply(var token,Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.reports+"/reply",
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
