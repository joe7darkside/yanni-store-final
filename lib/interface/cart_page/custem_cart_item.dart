import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/interface/cart_page/pop_up_menu.dart';

class ItemModel {
  String title;
  IconData icon;
  ItemModel(this.title, this.icon);
}

class CustemCartItem extends StatelessWidget {
  CustemCartItem({Key? key}) : super(key: key);

  // final CustomPopUpMenuController customPopUpMenuController =
  //     Get.put(CustomPopUpMenuController());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        height: Adaptive.h(14),
        width: Adaptive.w(90),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/bg.jpg'),
                          alignment: Alignment.centerLeft),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  height: Adaptive.h(20),
                  width: Adaptive.w(30)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Electrec Guitar",
                      style: GoogleFonts.lato(
                        fontSize: Adaptive.sp(18),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Color: ',
                              style: GoogleFonts.lato(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.grey[700])),
                          TextSpan(
                              text: 'World',
                              style: GoogleFonts.lato(
                                  fontSize: Adaptive.sp(16),
                                  color: Colors.grey[800])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: Adaptive.w(7),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Icon(FontAwesomeIcons.ellipsisH),
                      onTap: () => null,
                    ),
                    Text(
                      "304 \$",
                      style: GoogleFonts.lato(
                          fontSize: Adaptive.sp(17), color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ]));
  }

  // var menuItems = [
  //   ItemModel('发起群聊', Icons.chat_bubble),
  //   ItemModel('添加朋友', Icons.group_add),
  //   ItemModel('扫一扫', Icons.settings_overscan),
  // ];

  // Widget getPopUpMenu() {
  //   return CustomPopUpMenuButton(
  //     menuBuilder: () => ClipRRect(
  //       borderRadius: BorderRadius.circular(5),
  //       child: Container(
  //         color: const Color(0xFF4C4C4C),
  //         child: IntrinsicWidth(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: menuItems
  //                 .map(
  //                   (item) => GestureDetector(
  //                     behavior: HitTestBehavior.translucent,
  //                     onTap: customPopUpMenuController.hideMenu,
  //                     child: Container(
  //                       height: 40,
  //                       padding: EdgeInsets.symmetric(horizontal: 20),
  //                       child: Row(
  //                         children: <Widget>[
  //                           Icon(
  //                             item.icon,
  //                             size: 15,
  //                             color: Colors.white,
  //                           ),
  //                           Expanded(
  //                             child: Container(
  //                               margin: EdgeInsets.only(left: 10),
  //                               padding: EdgeInsets.symmetric(vertical: 10),
  //                               child: Text(
  //                                 item.title,
  //                                 style: TextStyle(
  //                                   color: Colors.white,
  //                                   fontSize: 12,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 )
  //                 .toList(),
  //           ),
  //         ),
  //       ),
  //     ),
  //     controller: customPopUpMenuController,
  //     pressType: PressType.singlePress,
  //     child: Text('ssss'),
  //   );
  // }
}
