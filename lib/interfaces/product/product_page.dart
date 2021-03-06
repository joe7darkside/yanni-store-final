import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/controllers/rating_controller.dart';
import 'package:yanni_store/models/rating_star_model.dart';

class ProductScreen extends StatelessWidget {
  final RatingController ratingController = Get.put(RatingController());
  final List data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    // print(data[3]);
    return SafeArea(
      child: Scaffold(
          body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.only(
                        right: 10, top: 10, bottom: 10, left: 10),
                    width: 50,
                    height: 50,
                    child: LikeButton(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      isLiked: data[2],
                      animationDuration: const Duration(milliseconds: 700),
                      bubblesSize: 30,
                      bubblesColor: const BubblesColor(
                          dotPrimaryColor: Colors.red,
                          dotSecondaryColor: Colors.redAccent),
                      size: 30,
                      // likeCount: likes,
                    ),
                  ),
                ],
                leading: Container(
                  margin: EdgeInsets.all(8),
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: Colors.grey[800],
                      )),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Hero(
                        tag: 'image${data[7]}',
                        child: Image.network(
                          data[3],
                          fit: BoxFit.fill,
                          width: Adaptive.w(100),
                          height: Adaptive.h(40),
                        ),
                      ),

                      // )
                    ],
                  ),
                ),
                expandedHeight: Adaptive.h(40),
                backgroundColor: Colors.transparent,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  padding: EdgeInsets.all(12),
                  color: Colors.white,
                  width: Adaptive.h(100),
                  height: Adaptive.h(75),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data[0],
                            style: GoogleFonts.lato(
                                fontSize: 26, color: Colors.black),
                          ),
                          LikeButton(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            isLiked: data[2],
                            animationDuration:
                                const Duration(milliseconds: 700),
                            bubblesSize: 30,
                            bubblesColor: const BubblesColor(
                                dotPrimaryColor: Colors.red,
                                dotSecondaryColor: Colors.redAccent),
                            size: 30,
                            // likeCount: likes,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SmoothStarRating(
                        rating: data[6],
                        allowHalfRating: true,
                        color: Colors.orange,
                        borderColor: Colors.orange,
                        starCount: 5,
                        spacing: 2,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "\$ ${data[4]}",
                        style:
                            GoogleFonts.lato(fontSize: 20, color: Colors.blue),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Product Details',
                        style: GoogleFonts.lato(fontSize: 26),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        data[5],
                        style: GoogleFonts.lato(fontSize: 16),
                      ),
                    ],
                  ),
                );
              }, childCount: 1))
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(
                height: 5,
                color: Colors.grey[500],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Buy',
                    style: GoogleFonts.lato(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(54, 98, 147, 1)),
                      elevation: MaterialStateProperty.all(2),
                      enableFeedback: true,
                      fixedSize: MaterialStateProperty.all(
                        Size(double.maxFinite, 45),
                      )),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
