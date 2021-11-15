import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustemContainer extends StatelessWidget {
  CustemContainer(
      {required this.tilte, required this.icon, required this.path});
  final tilte;
  final icon;
  final path;
  // final subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(path),
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: ListTile(
          leading: Icon(icon),
          title: Text(tilte),
          // subtitle: Text(subTitle),
        ),
      ),
    );
  }
}










// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class CustemContainer extends StatelessWidget {
//   CustemContainer({this.tilte, this.subTitle});
//   final tilte;
//   final subTitle;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => print('works'),
//       child: Container(margin: EdgeInsets.only(top: 5),
//         decoration: const BoxDecoration(
//             boxShadow: [
//               // BoxShadow(
//               //   color: Colors.grey,
//               //   offset: Offset(0.0, 0.2),
//               //   blurRadius: 2.0,
//               // ),
//             ],
//             color: Colors.white60,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(7),
//                 topRight: Radius.circular(7),
//                 bottomLeft: Radius.circular(7),
//                 bottomRight: Radius.circular(7))),
//         width: Adaptive.w(90),
//         height: Adaptive.h(11),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     tilte,
//                     style: TextStyle(
//                       fontSize: 19,
//                     ),
//                   ),
//                   SizedBox(
//                     height: Adaptive.h(1.3),
//                   ),
//                   Text(
//                     subTitle,
//                     style: TextStyle(
//                       color: Colors.grey[800],
//                       fontSize: 15,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Spacer(),
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Icon(Icons.arrow_forward_ios),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
