import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onboarding/onboarding.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnBoardingController {
  final onboardingPagesList = [
    PageModel(
      widget: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            'assets/onBoarding/music.svg',
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          const Spacer(),
          const SizedBox(
              width: double.infinity,
              child: Text('WELCOME TO YANNI', style: pageTitleStyle)),
          Container(
            margin: EdgeInsets.only(bottom: 20),
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
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            'assets/onBoarding/online_shoping.svg',
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          Spacer(),
          Container(
              width: double.infinity,
              child: Text('ANYTHING YOU NEED', style: pageTitleStyle)),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: Text(
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
          SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            'assets/onBoarding/delivery.svg',
            height: Adaptive.h(40),
            width: Adaptive.h(50),
          ),
          Spacer(),
          Container(
              width: double.infinity,
              child: Text('TO YOUR DOORSTEP', style: pageTitleStyle)),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.infinity,
            child: Text(
              'Fast delivery time to your doorstep',
              style: pageInfoStyle,
            ),
          ),
        ],
      ),
    ),
  ];
}
