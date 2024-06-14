import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectoneuniversity/core/class/crud.dart';
import 'package:projectoneuniversity/core/class/statusrequest.dart';
import 'package:projectoneuniversity/core/constants/animations.dart';
import 'package:projectoneuniversity/core/functions/alerts.dart';
import 'package:projectoneuniversity/core/functions/handeling_data.dart';
import 'package:projectoneuniversity/core/services/services.dart';
import 'package:projectoneuniversity/data/model/categorie_model.dart';
import 'package:projectoneuniversity/data/remote/CategoryBack.dart';

class CategoryController extends GetxController {
  SharedPrefrencesServices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  Categoryback categoryback = new Categoryback(Get.put(Crud()));
  TextEditingController englishName = new TextEditingController();
  TextEditingController arabicName = new TextEditingController();

  late String token, language;
  StatusRequest? statusRequest, addCategoryStatus;
  List<CategoryModel> categories = [];
  bool isAdding = false;
  var image;
  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    language = myServices.sharedPreferences.getString("lang")!;
    getCategories();
    super.onInit();
  }

  getCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await categoryback.getCategories(token, language);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        for (var reviewData in response['data']) {
          categories.add(CategoryModel.fromJson(reviewData));
        }
      }
    }
    update();
  }

  addCategory() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      if (image == null) {
        animationedAlert(AppAnimations.wrong, "Pleaseaddimage".tr);
        return;
      }
      addCategoryStatus = StatusRequest.loading;
      var response = await categoryback.postCategory(
          token, image, {"name_EN": englishName, "name_AR": arabicName});
      addCategoryStatus = handelingData(response);
      if (StatusRequest.success == addCategoryStatus) {
        if (response['status'] == "success") {
          Get.back();
        }
      }
    }
    update();
  }

  deleteCategory(int id) async {
    statusRequest = StatusRequest.loading;
    var response = await categoryback.deleteCategory(id.toString(), token);
    statusRequest = handelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.back();
      }
    }
    update();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    update();
  }
}
