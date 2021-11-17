import 'package:get/get.dart';

class RatingController extends GetxController {
  var rating = 0.obs;

  void rate(int data) {
    rating.value = data;
  }
}
