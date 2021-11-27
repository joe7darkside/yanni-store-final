import 'package:get/get.dart';

class AnimationCategoryController extends GetxController
    with SingleGetTickerProviderMixin {
  var selected = 0;
  var isSelected = false;
  void onSelected(int index) {
    selected = index;
    isSelected = true;
    update();
  }

  // AnimationController? animationsController;
  // Animation? animation;
  // @override
  // void onInit() {
  //   animationsController = AnimationController(
  //     vsync: this,
  //     duration: Duration(milliseconds: 300),
  //   );
  //   animation = Tween(begin: 60.0, end: 120.0).animate(CurvedAnimation(
  //     parent: animationsController!,
  //     curve: Curves.bounceInOut,
  //   ))
  //     ..addListener(() {
  //       update();
  //     });
  //   super.onInit();
  // }
}
