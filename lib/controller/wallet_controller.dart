import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/links.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/model/user_budget_model.dart';
import 'package:projectoneuniversity/data/remote/wallet_back.dart';
import '../core/constants/animations.dart';

class WalletController extends GetxController {
  StatusRequest? statusRequest, addStatusRequest;
  late String token;
  SharedPrefrencesServices myServices = Get.find();
  WalletBack walletBack = WalletBack(Get.put(Crud()));
  bool isAdding = false;
  List<UserWalletModel> users = [];
  TextEditingController user = TextEditingController();
  TextEditingController balance = TextEditingController();
  int selectedUser = 0;
  @override
  void onInit() async {
    token = myServices.sharedPreferences.getString("token")!;
    // getTags();
    super.onInit();
  }

  searchUser() async {
    if (user.text == "") return;
    users.clear();
    statusRequest = StatusRequest.loading;
    var response = await walletBack.searchUser(
      token,
      "${AppLinks.budget}/search/?search=${user.text}",
      {},
    );
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var data in response['data']) {
          users.add(UserWalletModel.fromJson(data));
        }
      } else {}
    } else {}
    update();
  }

  chargeUser(
    int userId,
  ) async {
    addStatusRequest = StatusRequest.loading;
    animationedAlert(AppAnimations.loadings, "pleasewait".tr);

    var response = await walletBack.chargeWallet(
        token,
        {"balance": balance.text, "user_id": userId.toString()},
        "${AppLinks.budget}/charge/");
    addStatusRequest = handelingData(response);
    Get.back();
    if (StatusRequest.success == addStatusRequest) {
      if (response['status'] == "success") {
        animationedAlert(AppAnimations.done, "78".tr);
      } else {
        animationedAlert(AppAnimations.wrong, "79".tr);
      }
    } else {
      animationedAlert(AppAnimations.wrong, "79".tr);
    }
    update();
  }
}
