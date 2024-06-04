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

abstract class CategoryController extends GetxController {
  getCategories();
  addCategory();
  pickImage();
}

class CategoryControllerImpl extends CategoryController {
  Myservices myServices = Get.find();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Categoryback categoryback = new Categoryback(Get.put(Crud()));
  late String token;
  late String language;
  StatusRequest? statusRequest, addCategoryStatus;
  TextEditingController name = new TextEditingController();
  List<CategoryModel> categories = [];
  bool isAdding = false;
  var image;
  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!
    ;
    // language = myServices.sharedPreferences.getString("lang")!;
    getCategories();
    super.onInit();
  }

  @override
  getCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await categoryback.getCategories(token, "en");
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

  @override
  addCategory() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      if (image == null) {
        animationedAlert(AppAnimations.wrong, "Pleaseaddimage".tr);
        return;
      }
      addCategoryStatus = StatusRequest.loading;
      var response = categoryback.postCategory(token, image);
      addCategoryStatus = handelingData(response);
      if (StatusRequest.success == addCategoryStatus) {
        if (response['status'] == "success") {
          for (var reviewData in response['data']) {
            categories.add(CategoryModel.fromJson(reviewData));
          }
        }
      }
    }
    update();
  }

  @override
  Future<void> pickImage() async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      print(pickedImage.path);
      image = File(pickedImage.path);
    } else {
      print("Image picking canceled");
    }
    update();
  }
}
