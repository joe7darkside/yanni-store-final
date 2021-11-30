import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yanni_store/controllers/animation_floating_button.dart';

class AnimationFloatingButton extends StatelessWidget {
  AnimationFloatingButton({Key? key}) : super(key: key);
  final AnimtationFloatingButtonController animtationFloatingButtonController =
      Get.put(AnimtationFloatingButtonController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimtationFloatingButtonController>(
        init: AnimtationFloatingButtonController(),
        builder: (AnimtationFloatingButtonController) {
          return Stack(
            children: [
              Transform.translate(
                  offset: Offset.fromDirection(
                      animtationFloatingButtonController
                          .getRadiosFromDegree(180),
                      animtationFloatingButtonController
                              .degreeOneTranslationAnimation?.value *
                          100),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                        animtationFloatingButtonController.getRadiosFromDegree(
                            animtationFloatingButtonController
                                .rotationController!.value))
                      ..scale(animtationFloatingButtonController
                          .degreeOneTranslationAnimation!.value),
                    child: CustomButton(
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                      icon: const Icon(Icons.shopping_cart),
                      onClick: () => print('kkkkk'),
                    ),
                  )),
              Transform.translate(
                  offset: Offset.fromDirection(
                      animtationFloatingButtonController
                          .getRadiosFromDegree(270),
                      animtationFloatingButtonController
                              .degreeOneTranslationAnimation?.value *
                          100),
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                        animtationFloatingButtonController.getRadiosFromDegree(
                            animtationFloatingButtonController
                                .rotationController!.value))
                      ..scale(animtationFloatingButtonController
                          .degreeOneTranslationAnimation!.value),
                    child: CustomButton(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                      icon: const Icon(Icons.accessibility),
                      onClick: () => print('kkkkk'),
                    ),
                  )),
              Transform.translate(
                offset: Offset.fromDirection(
                    animtationFloatingButtonController.getRadiosFromDegree(223),
                    animtationFloatingButtonController
                            .degreeOneTranslationAnimation?.value *
                        100),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(
                      animtationFloatingButtonController.getRadiosFromDegree(
                          animtationFloatingButtonController
                              .rotationController!.value))
                    ..scale(animtationFloatingButtonController
                        .degreeOneTranslationAnimation!.value),
                  child: CustomButton(
                    color: Colors.greenAccent,
                    height: 50,
                    width: 50,
                    icon: const Icon(Icons.ac_unit),
                    onClick: () => print('kkkkk'),
                  ),
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(animtationFloatingButtonController
                    .getRadiosFromDegree(animtationFloatingButtonController
                        .rotationController!.value)),
                child: CustomButton(
                  color: Colors.amber,
                  height: 60,
                  width: 60,
                  icon: const Icon(FontAwesomeIcons.plus),
                  onClick: () {
                    if (animtationFloatingButtonController
                        .animationControllers!.isCompleted) {
                      animtationFloatingButtonController.animationControllers
                          ?.reverse();
                    } else {
                      animtationFloatingButtonController.animationControllers
                          ?.forward();
                    }
                  },
                ),
              )
            ],
          );
        });
  }
}

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Icon? icon;
  final Color? color;
  final Function onClick;

  const CustomButton(
      {Key? key,
      required this.width,
      required this.height,
      required this.icon,
      required this.color,
      required this.onClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: IconButton(
        icon: icon!,
        onPressed: () => onClick(),
        enableFeedback: true,
      ),
    );
  }
}
