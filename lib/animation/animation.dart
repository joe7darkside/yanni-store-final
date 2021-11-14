// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
// import 'package:yanni_store/interface/cart_page/animation_controller.dart';

// class EmptyCart extends StatefulWidget {
//   EmptyCart({Key? key}) : super(key: key);

//   @override
//   _EmptyCartState createState() => _EmptyCartState();
// }

// class _EmptyCartState extends State<EmptyCart>
//     with SingleTickerProviderStateMixin {
//   final AnimationControllerClass animationController =
//       Get.put(AnimationControllerClass());
//   AnimationController? animationControllers;
//   Animation? degreeOneTranslationAnimation;
//   Animation? rotationController;
//   @override
//   void initState() {
//     animationControllers = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 250));
//     degreeOneTranslationAnimation =
//         Tween(begin: 0.0, end: 1.0).animate(animationControllers!);
//     super.initState();
//     animationControllers!.addListener(() {
//       setState(() {});
//     });
//     rotationController = Tween(begin: 180.0, end: 0.0).animate(
//         CurvedAnimation(parent: animationControllers!, curve: Curves.easeOut));
//   }

//   getRadiosFromDegree(var degree) {
//     double unitRadios = 57.295779513;
//     return degree / unitRadios;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//             right: 25,
//             bottom: 25,
//             child: Stack(
//               children: [
//                 Transform.translate(
//                     offset: Offset.fromDirection(getRadiosFromDegree(180),
//                         degreeOneTranslationAnimation?.value * 100),
//                     child: Transform(
//                       alignment: Alignment.center,
//                       transform: Matrix4.rotationZ(
//                           getRadiosFromDegree(rotationController!.value))
//                         ..scale(degreeOneTranslationAnimation!.value),
//                       child: CustomButton(
//                         color: Colors.blue,
//                         height: 50,
//                         width: 50,
//                         icon: Icon(Icons.shopping_cart),
//                         onClick: () => print('kkkkk'),
//                       ),
//                     )),
//                 Transform.translate(
//                     offset: Offset.fromDirection(getRadiosFromDegree(270),
//                         degreeOneTranslationAnimation?.value * 100),
//                     child: Transform(
//                       alignment: Alignment.center,
//                       transform: Matrix4.rotationZ(
//                           getRadiosFromDegree(rotationController!.value))
//                         ..scale(degreeOneTranslationAnimation!.value),
//                       child: CustomButton(
//                         color: Colors.red,
//                         height: 50,
//                         width: 50,
//                         icon: Icon(Icons.accessibility),
//                         onClick: () => print('kkkkk'),
//                       ),
//                     )),
//                 Transform.translate(
//                     offset: Offset.fromDirection(getRadiosFromDegree(223),
//                         degreeOneTranslationAnimation?.value * 100),
//                     child: Transform(
//                       alignment: Alignment.center,
//                       transform: Matrix4.rotationZ(
//                           getRadiosFromDegree(rotationController!.value))
//                         ..scale(degreeOneTranslationAnimation!.value),
//                       child: CustomButton(
//                         color: Colors.greenAccent,
//                         height: 50,
//                         width: 50,
//                         icon: Icon(Icons.ac_unit),
//                         onClick: () => print('kkkkk'),
//                       ),
//                     )),
//                 Transform(
//                   alignment: Alignment.center,
//                   transform: Matrix4.rotationZ(
//                       getRadiosFromDegree(rotationController!.value)),
//                   child: CustomButton(
//                     color: Colors.amber,
//                     height: 60,
//                     width: 60,
//                     icon: Icon(FontAwesomeIcons.plus),
//                     onClick: () {
//                       if (animationControllers!.isCompleted) {
//                         animationControllers?.reverse();
//                       } else {
//                         animationControllers?.forward();
//                       }
//                     },
//                   ),
//                 )
//               ],
//             )),
//       ],
//     );
//   }
// }

// class CustomButton extends StatelessWidget {
//   final double? width;
//   final double? height;
//   final Icon? icon;
//   final Color? color;
//   final Function onClick;

//   const CustomButton(
//       {Key? key,
//       required this.width,
//       required this.height,
//       required this.icon,
//       required this.color,
//       required this.onClick})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(shape: BoxShape.circle, color: color),
//       child: IconButton(
//         icon: icon!,
//         onPressed: () => onClick(),
//         enableFeedback: true,
//       ),
//     );
//   }
// }
