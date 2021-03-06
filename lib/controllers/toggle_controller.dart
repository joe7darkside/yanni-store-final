import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleController extends GetxController {
  var toggleValue1 = false.obs;
  var toggleValue2 = false.obs;

  void toggleButton1() {
    toggleValue1.value = !toggleValue1.value;
  }

  void toggleButton2() {
    toggleValue2.value = !toggleValue2.value;
    if (!toggleValue2.value) {
      Get.changeThemeMode(ThemeMode.light);
    } else {
      Get.changeThemeMode(ThemeMode.dark);
    }
  }
}
