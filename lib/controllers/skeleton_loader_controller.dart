// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class SkeletonController extends GetxController
//     with SingleGetTickerProviderMixin {
//   AnimationController? animationController;
//   var animation = Rx<Animation?>(null);

//   @override
//   void onInit() {
//     skeletonAnimation();
//     super.onInit();
//   }

//   void skeletonAnimation() {
//     animationController = AnimationController.unbounded(
//         vsync: this, duration: const Duration(milliseconds: 1000));
//     animation.value = Tween<double>(
//       begin: -3,
//       end: 10,
//     ).animate(
//       CurvedAnimation(parent: animationController!, curve: Curves.linear),
//     )..addListener(() {
   
//       });

//     // animationController!.repeat();
//   }
// }








// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';

// // class SkeletonLoaderController extends GetxController
// //     with SingleGetTickerProviderMixin {
// //   AnimationController? controller;
// //   var animation = Rx<Animation<Color>?>(null);

// //   @override
// //   void onInit() {
// //     skeletonScreen();
// //     super.onInit();
// //   }

// //   void skeletonScreen() {
// //     controller = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 800),
// //     );
// //     animation.value = TweenSequence<Color>(
// //       [
// //         TweenSequenceItem(
// //           weight: 1.0,
// //           tween: Tween(
// //             begin: Colors.white60,
// //             end: Colors.grey,
// //           ),
// //         ),
// //         TweenSequenceItem(
// //           weight: 1.0,
// //           tween: Tween<Color>(
// //             begin: Colors.grey,
// //             end: Colors.white60,
// //           ),
// //         ),
// //       ],
// //     ).animate(controller!)
// //       ..addListener(() {
// //         print('dddddddddddddddddddddddddddd');
// //       });

// //     controller!.repeat();
// //   }

// //   @override
// //   void onClose() {
// //     controller!.dispose();
// //     super.onClose();
// //   }
// // }
