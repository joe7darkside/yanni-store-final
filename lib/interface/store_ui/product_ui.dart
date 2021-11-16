import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreItemUi extends StatelessWidget {
  StoreItemUi(
      {Key? key,
      required this.title,
      required this.price,
      required this.likes,
      // required this.path,
      this.images,
      required this.category})
      : super(key: key);
  final String? title;
  final int? price;
  final int? likes;
  final List<String>? images;
  final String? category;
  var likeCount = 15;
  var buttonSize = 30.0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => null,
      child: Container(
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
                      "$title",
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
                          '$price\$',
                          style: GoogleFonts.roboto(
                              color: Colors.grey[600],
                              fontSize: Adaptive.sp(19),
                              fontWeight: FontWeight.w600),
                        ),
                        LikeButton(
                          animationDuration: Duration(milliseconds: 700),
                          bubblesSize: 30,
                          bubblesColor: BubblesColor(
                              dotPrimaryColor: Colors.red,
                              dotSecondaryColor: Colors.redAccent),
                          size: buttonSize,
                          likeCount: likes,
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
          )),
    );
  }
}
