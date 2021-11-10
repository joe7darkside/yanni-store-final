import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductUi extends StatelessWidget {
  const ProductUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14))),
        width: Adaptive.w(45),
        height: Adaptive.h(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Adaptive.w(45),
              height: Adaptive.h(22.5),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/22.jpg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yamaha Electrec Piano ",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      fontSize: Adaptive.sp(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: Adaptive.h(1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '870 \$',
                        style: GoogleFonts.roboto(
                            color: Colors.grey[600],
                            fontSize: Adaptive.sp(19),
                            fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () => null,
                        icon: Icon(
                          FontAwesomeIcons.heart,
                          size: Adaptive.sp(22),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],

          // Container(
          //   width: Adaptive.w(30),
          //   height: Adaptive.h(35),
          //   decoration: const BoxDecoration(
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey,
          //           offset: Offset(0.0, 0.5),
          //           blurRadius: 6.0,
          //         ),
          //       ],
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(25),
          //           topRight: Radius.circular(25),
          //           bottomLeft: Radius.circular(25),
          //           bottomRight: Radius.circular(25))),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         padding: EdgeInsets.only(left: 4),
          //         width: Adaptive.w(100),
          //         height: Adaptive.h(23),
          //         // margin:
          //         //     const EdgeInsets.only( left: 8, right: 8, bottom: 8),
          //         decoration: const BoxDecoration(
          //             image: DecorationImage(
          //               image: AssetImage('assets/images/22.jpg'),
          //               fit: BoxFit.fill,
          //             ),
          //             color: Colors.white,
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(10),
          //                 topRight: Radius.circular(10),
          //                 bottomLeft: Radius.circular(10),
          //                 bottomRight: Radius.circular(10))),
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.only(left: 10),
          //         child: Text(
          //           "Electrec piano",
          //           style: TextStyle(fontSize: 16),
          //         ),
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.only(left: 10, top: 5),
          //         child: Text(
          //           "100\$",
          //           style: TextStyle(fontSize: 16),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ));
  }
}
