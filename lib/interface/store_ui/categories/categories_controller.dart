import 'package:get/get.dart';

class CategoriesController extends GetxController {
  var selected = 0.obs;

  void onSelected(int index) {
    selected.value = index;
  }
}
