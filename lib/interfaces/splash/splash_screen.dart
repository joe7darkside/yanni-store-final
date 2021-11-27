import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yanni_store/interfaces/main/main_page.dart';
import 'package:yanni_store/interfaces/onBoarding/onboarding_screen.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _lottieAnimation;
  var expanded = false;
  final double _bigFontSize = kIsWeb ? 234 : 178;
  final transitionDuration = const Duration(seconds: 1);

  @override
  void initState() {
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    Future.delayed(Duration(seconds: 1))
        .then((value) => setState(() => expanded = true))
        .then((value) => const Duration(seconds: 1))
        .then(
          (value) => Future.delayed(const Duration(seconds: 1)).then(
            (value) => _lottieAnimation.forward().then(
                  (value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                              isviewed != 0 ? OnBoarding() : MainScreen()),
                      (route) => false),
                ),
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDefaultTextStyle(
              duration: transitionDuration,
              curve: Curves.fastOutSlowIn,
              style: TextStyle(
                color: Colors.blue[900],
                fontSize: !expanded ? _bigFontSize : 50,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
              ),
              child: Image.asset(
                'assets/logo/logo.png',
                width: 60,
              ),
            ),
            AnimatedCrossFade(
              firstCurve: Curves.fastOutSlowIn,
              crossFadeState: !expanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: transitionDuration,
              firstChild: Container(),
              secondChild: _logoRemainder(),
              alignment: Alignment.centerLeft,
              sizeCurve: Curves.easeInOut,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoRemainder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          " YANNI STORE",
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 35,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        // LottieBuilder.asset(
        //   'assets/images/logo/guitar.json',
        //   onLoaded: (composition) {
        //     _lottieAnimation..duration = composition.duration;
        //   },
        //   frameRate: FrameRate.max,
        //   repeat: false,
        //   animate: false,
        //   height: 120,
        //   width: 120,
        //   controller: _lottieAnimation,
        // )
      ],
    );
  }
}
