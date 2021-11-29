import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/controllers/animation_controller.dart';
import 'package:yanni_store/controllers/nav_controller.dart';
import 'package:yanni_store/utils/images.dart';
import 'package:yanni_store/widgets/circular_button/circular_button.dart';

class EmptyCartScreen extends StatelessWidget {
  final BottonNavBar bottonNavBar = Get.put(BottonNavBar());
  final AnimationsController animationsController =
      Get.put(AnimationsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimationsController>(
      builder: (AnimationsController) {
        return Container(
          width: Adaptive.w(100),
          height: Adaptive.h(100),
          child: Column(children: [
            const Spacer(),
            SvgPicture.asset(
              emptyCart,
              width: Adaptive.w(30),
              height: Adaptive.h(30),
            ),
            SizedBox(
              height: Adaptive.h(10),
            ),
            Text(
              "Empty Cart",
              style: GoogleFonts.lato(
                color: Colors.grey[600],
                fontSize: Adaptive.sp(22),
              ),
            ),
            SizedBox(
              height: Adaptive.h(5),
            ),
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(
                  animationsController.getRadiosFromDegree(
                      animationsController.rotationController!.value)),
              child: CircularButton(
                color: Colors.blue,
                height: 60,
                width: 60,
                icon: const Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                ),
                onClick: () {
                  bottonNavBar.onTab(1);
                  if (animationsController.animationControllers!.isCompleted) {
                    animationsController.animationControllers?.reverse();
                  } else {
                    animationsController.animationControllers?.forward();
                  }
                },
              ),
            ),
            SizedBox(
              height: Adaptive.h(8),
            ),
          ]),
        );
      },
      init: AnimationsController(),
    );
  }
}
