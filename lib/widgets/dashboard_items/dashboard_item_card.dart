import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemCards extends StatelessWidget {
  ItemCards(
      {Key? key,
      required this.number,
      required this.title,
      required this.price,
      required this.likes,
      required this.descraption,
      required this.rating,
      this.images,
      required this.category})
      : super(key: key);
  final int? number;
  String? descraption;
  final String? title;
  final int? price;
  final bool? likes;
  final String? images;
  final int? rating;
  final String? category;
  var likeCount = 15;
  var buttonSize = 30.0;
  @override
  Widget build(BuildContext context) {
    var url = Uri.parse("$images");
    // print(url);

    return GestureDetector(
      onTap: () => _simplePopup(),
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
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('$url'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
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
                            isLiked: likes,
                            animationDuration:
                                const Duration(milliseconds: 700),
                            bubblesSize: 30,
                            bubblesColor: const BubblesColor(
                                dotPrimaryColor: Colors.red,
                                dotSecondaryColor: Colors.redAccent),
                            size: buttonSize,
                            // likeCount: likes,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ])),
    );
  }

  Widget _simplePopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text("First"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Second"),
          ),
        ],
      );
}
