// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';

// enum PressType { longPress, singlePress }
// enum PreferredPosition { top, botton }

// class CustomPopUpMenuController extends GetxController {
//   bool menuIsShowing = false;

//   void showingMenu() {
//     menuIsShowing = true;
//     update();
//   }

//   void hideMenu() {
//     menuIsShowing = false;
//     update();
//   }

//   void toggleMenu() {
//     menuIsShowing = !menuIsShowing;
//     update();
//   }
// }

// // ignore: must_be_immutable
// class CustomPopUpMenuButton extends StatelessWidget {
//   CustomPopUpMenuButton({Key? key, 
   
//     required this.child,
//     required this.menuBuilder,
//     required this.pressType,
//     this.controller,
//     this.arrowColor = const Color(0xFF4C4C4C),
//     this.showArrow = true,
//     this.barrierColor = Colors.black12,
//     this.arrowSize = 10.0,
//     this.horizontalMargin = 10.0,
//     this.verticalMargin = 10.0,
//     this.position,
//     this.menuOnChange,
//   }) : super(key: key);

//   final Widget child;
//   final PressType pressType;
//   final bool showArrow;
//   final Color arrowColor;
//   final Color barrierColor;
//   final double horizontalMargin;
//   final double verticalMargin;
//   final double arrowSize;
//   final CustomPopUpMenuController? controller;
//   final Widget Function() menuBuilder;
//   final PreferredPosition? position;
//   final void Function(bool)? menuOnChange;

//   RenderBox? _childBox;
//   RenderBox? _parentBox;
//   OverlayEntry? _overlayEntry;
//   CustomPopUpMenuController? _controller;

//   _showMenu() {
//     Widget arrow = ClipPath(
//       child: Container(
//         width: arrowSize,
//         height: arrowSize,
//         color: arrowColor,
//       ),
//       clipper: _ArrowClipper(),
//     );
//     _overlayEntry = OverlayEntry(builder: (context) {
//       return Stack(
//         children: <Widget>[
//           GestureDetector(
//             onTap: () {
//               _controller?.hideMenu();
//             },
//             child: Container(
//               color: barrierColor,
//             ),
//           ),
//           Center(
//               child: Container(
//             constraints: BoxConstraints(
//                 maxWidth: _parentBox!.size.width - 2 * horizontalMargin,
//                 minWidth: 0),
//             child: CustomMultiChildLayout(
//               delegate: _MenuLayoutDelegate(
//                 anchorSize: _childBox!.size,
//                 anchorOffset: _childBox!.localToGlobal(
//                   Offset(-horizontalMargin, 0),
//                 ),
//                 verticalMargin: verticalMargin,
//                 position: position,
//               ),
//             ),
//           ))
//         ],
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// enum _MenuLayoutId {
//   arrow,
//   downArrow,
//   content,
// }

// enum _MenuPosition {
//   bottomLeft,
//   bottomCenter,
//   bottomRight,
//   topLeft,
//   topCenter,
//   topRight,
// }

// class _MenuLayoutDelegate extends MultiChildLayoutDelegate {
//   _MenuLayoutDelegate({
//     required this.anchorSize,
//     required this.anchorOffset,
//     required this.verticalMargin,
//     this.position,
//   });

//   final Size anchorSize;
//   final Offset anchorOffset;
//   final double verticalMargin;
//   final PreferredPosition? position;

//   @override
//   void performLayout(Size size) {
//     Size contentSize = Size.zero;
//     Size arrowSize = Size.zero;
//     Offset contentOffset = Offset(0, 0);
//     Offset arrowOffset = Offset(0, 0);

//     double anchorCenterX = anchorOffset.dx + anchorSize.width / 2;
//     double anchorTopY = anchorOffset.dy;
//     double anchorBottomY = anchorTopY + anchorSize.height;
//     _MenuPosition menuPosition = _MenuPosition.bottomCenter;

//     if (hasChild(_MenuLayoutId.content)) {
//       contentSize = layoutChild(
//         _MenuLayoutId.content,
//         BoxConstraints.loose(size),
//       );
//     }
//     if (hasChild(_MenuLayoutId.arrow)) {
//       arrowSize = layoutChild(
//         _MenuLayoutId.arrow,
//         BoxConstraints.loose(size),
//       );
//     }
//     if (hasChild(_MenuLayoutId.downArrow)) {
//       layoutChild(
//         _MenuLayoutId.downArrow,
//         BoxConstraints.loose(size),
//       );
//     }

//     bool isTop = false;
//     if (position == null) {
//       // auto calculate position
//       isTop = anchorBottomY > size.height / 2;
//     } else {
//       isTop = position == PreferredPosition.top;
//     }
//     if (anchorCenterX - contentSize.width / 2 < 0) {
//       menuPosition = isTop ? _MenuPosition.topLeft : _MenuPosition.bottomLeft;
//     } else if (anchorCenterX + contentSize.width / 2 > size.width) {
//       menuPosition = isTop ? _MenuPosition.topRight : _MenuPosition.bottomRight;
//     } else {
//       menuPosition =
//           isTop ? _MenuPosition.topCenter : _MenuPosition.bottomCenter;
//     }

//     switch (menuPosition) {
//       case _MenuPosition.bottomCenter:
//         arrowOffset = Offset(
//           anchorCenterX - arrowSize.width / 2,
//           anchorBottomY + verticalMargin,
//         );
//         contentOffset = Offset(
//           anchorCenterX - contentSize.width / 2,
//           anchorBottomY + verticalMargin + arrowSize.height,
//         );
//         break;
//       case _MenuPosition.bottomLeft:
//         arrowOffset = Offset(anchorCenterX - arrowSize.width / 2,
//             anchorBottomY + verticalMargin);
//         contentOffset = Offset(
//           0,
//           anchorBottomY + verticalMargin + arrowSize.height,
//         );
//         break;
//       case _MenuPosition.bottomRight:
//         arrowOffset = Offset(anchorCenterX - arrowSize.width / 2,
//             anchorBottomY + verticalMargin);
//         contentOffset = Offset(
//           size.width - contentSize.width,
//           anchorBottomY + verticalMargin + arrowSize.height,
//         );
//         break;
//       case _MenuPosition.topCenter:
//         arrowOffset = Offset(
//           anchorCenterX - arrowSize.width / 2,
//           anchorTopY - verticalMargin - arrowSize.height,
//         );
//         contentOffset = Offset(
//           anchorCenterX - contentSize.width / 2,
//           anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
//         );
//         break;
//       case _MenuPosition.topLeft:
//         arrowOffset = Offset(
//           anchorCenterX - arrowSize.width / 2,
//           anchorTopY - verticalMargin - arrowSize.height,
//         );
//         contentOffset = Offset(
//           0,
//           anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
//         );
//         break;
//       case _MenuPosition.topRight:
//         arrowOffset = Offset(
//           anchorCenterX - arrowSize.width / 2,
//           anchorTopY - verticalMargin - arrowSize.height,
//         );
//         contentOffset = Offset(
//           size.width - contentSize.width,
//           anchorTopY - verticalMargin - arrowSize.height - contentSize.height,
//         );
//         break;
//     }
//     if (hasChild(_MenuLayoutId.content)) {
//       positionChild(_MenuLayoutId.content, contentOffset);
//     }
//     bool isBottom = false;
//     if (_MenuPosition.values.indexOf(menuPosition) < 3) {
//       // bottom
//       isBottom = true;
//     }
//     if (hasChild(_MenuLayoutId.arrow)) {
//       positionChild(
//         _MenuLayoutId.arrow,
//         isBottom
//             ? Offset(arrowOffset.dx, arrowOffset.dy + 0.1)
//             : Offset(-100, 0),
//       );
//     }
//     if (hasChild(_MenuLayoutId.downArrow)) {
//       positionChild(
//         _MenuLayoutId.downArrow,
//         !isBottom
//             ? Offset(arrowOffset.dx, arrowOffset.dy - 0.1)
//             : Offset(-100, 0),
//       );
//     }
//   }

//   @override
//   bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
//     // TODO: implement shouldRelayout
//     throw UnimplementedError();
//   }
// }

// class _ArrowClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.moveTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }






// // class CustomPopUpMenu extends StatelessWidget {
// //   const CustomPopUpMenu({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return PopupMenuButton(
// //       itemBuilder: (context) {
// //         var list = <PopupMenuEntry<Object>>[];
// //         list.add(
// //           const PopupMenuItem(
// //             child: Text("Add to Faviaret"),
// //             value: 1,
// //           ),
// //         );
// //         list.add(
// //           const PopupMenuDivider(
// //             height: 10,
// //           ),
// //         );
// //         list.add(
// //           const CheckedPopupMenuItem(
// //             value: 2,
// //             checked: true,
// //             child: Text("English"),
// //           ),
// //         );
// //         return list;
// //       },
// //       icon: const Icon(
// //         FontAwesomeIcons.ellipsisH,
// //         size: 50,
// //         color: Colors.white,
// //       ),
// //       initialValue: 1,
// //       onCanceled: () {
// //         print("You have canceled the menu");
// //       },
// //       onSelected: (value) {
// //         print("value: $value");
// //       },
// //       // child: SingleChildScrollView(
// //       //   child: Column(
// //       //     children: [
// //       //       Text('one'),
// //       //       Text('two'),
// //       //       Text('three'),
// //       //       Text('four'),
// //       //     ],
// //       //   ),
// //       // ),
// //     );
// //   }
// // }
