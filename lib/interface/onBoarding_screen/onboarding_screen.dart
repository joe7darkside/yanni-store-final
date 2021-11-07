// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';
import 'package:yanni_store/main/main_page.dart';

import 'onboarding_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class OnBoarding extends StatelessWidget {
  final OnBoardingController onBoardingController =
      Get.put(OnBoardingController());
  // _storeOnboardInfo() async {
  //   print("Shared pref called");
  //   int isViewed = 0;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('onBoard', isViewed);
  //   print(prefs.getInt('onBoard'));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        background: Colors.white,
        skipButtonStyle: SkipButtonStyle(),
        proceedButtonStyle: ProceedButtonStyle(proceedButtonRoute: (context) {
          // _storeOnboardInfo();
          return Get.offAll(() => MainPage());
        }),
        pages: onBoardingController.onboardingPagesList,
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
