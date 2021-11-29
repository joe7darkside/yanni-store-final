import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yanni_store/interfaces/main/main_page.dart';
import 'package:yanni_store/utils/images.dart';
import '../../main.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  _storeOnboardInfo() async {
    isviewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isviewed!);
  }

  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            onboardingImageOne,
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          const Spacer(),
          const SizedBox(
              width: double.infinity,
              child: Text('WELCOME TO YANNI', style: pageTitleStyle)),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: const Text(
              'Home of music and playing instruments',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            onboardingImageTwo,
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          const Spacer(),
          const SizedBox(
              width: double.infinity,
              child: Text('ANYTHING YOU NEED', style: pageTitleStyle)),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: const Text(
              'Wide variety of Music instrument ',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
    PageModel(
      widget: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            onboardingImageThree,
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          const Spacer(),
          const SizedBox(
              width: double.infinity,
              child: Text('TO YOUR DOORSTEP', style: pageTitleStyle)),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: const Text(
              'Fast delivery time to your doorstep',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        background: Colors.white,
        skipButtonStyle: const SkipButtonStyle(),
        proceedButtonStyle: ProceedButtonStyle(proceedButtonRoute: (context) {
          _storeOnboardInfo();
          return Get.offAll(() => MainScreen());
        }),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_uniform,
            ),
          ),
        ),
      ),
    );
  }
}
