import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimtationFloatingButtonController extends GetxController
    with SingleGetTickerProviderMixin {
  AnimationController? animationControllers;
  Animation? degreeOneTranslationAnimation;
  Animation? rotationController;
  @override
  void onInit() {
    animationControllers = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    degreeOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationControllers!);
    animationControllers!.addListener(() {
      update();
    });
    rotationController = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationControllers!, curve: Curves.easeOut));

    super.onInit();
  }

  getRadiosFromDegree(var degree) {
    double unitRadios = 57.295779513;
    return degree / unitRadios;
  }
}
