import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/remote/prices_back.dart';

class PricesController extends GetxController {
  bool isAdding = false;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  List data = [];
  List<TextEditingController> prices = [];
  PricesBack priceBack = new PricesBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  SharedPrefrencesServices myServices = Get.find();
  late String token, lang;
  bool isEditing = false;
  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    lang = myServices.sharedPreferences.getString("lang")!;
    getPrices();
    super.onInit();
  }

  getPrices() async {
    statusRequest = StatusRequest.loading;
    var response = await priceBack.getPrices(token, lang);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
        for (int i = 0; i < response['data'].length; i++) {
          prices.add(TextEditingController(text: response['data'][i]['price']));
        }
      }
    }
    update();
  }

  editPrice(BuildContext context) async {
    var formData = formState.currentState;
    if (formData!.validate()) {}
  }
}
