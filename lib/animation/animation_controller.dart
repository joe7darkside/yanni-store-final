import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationsController extends GetxController
    with SingleGetTickerProviderMixin {
  Animation? rotationController;
  AnimationController? animationControllers;
  Animation? degreeOneTranslationAnimation;
  getRadiosFromDegree(var degree) {
    double unitRadios = 57.295779513;
    return degree / unitRadios;
  }

  @override
  void onInit() {
    animationControllers = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    degreeOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationControllers!);
    super.onInit();
    rotationController = Tween(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationControllers!, curve: Curves.easeOut));
    animationControllers!.addListener(() {
      update();
    });
  }
}
