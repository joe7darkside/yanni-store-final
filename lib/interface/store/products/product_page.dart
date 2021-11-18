import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/products/rating_star/logic/raing_controller.dart';
import 'package:yanni_store/products/rating_star/logic/rating_star_model.dart';


//? complete the product page as sliver
class ProductPage extends StatelessWidget {
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
              // {title, category, likes, images, price,des,rating}
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Image.network(
                        data[3],
                        fit: BoxFit.fill,
                        width: Adaptive.w(100),
                        height: Adaptive.h(50),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 30,
                            ),
                            LikeButton(
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
                      ),
                    ],
                  ),
                ),
                expandedHeight: Adaptive.h(40),
                backgroundColor: Colors.transparent,
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 14, top: 12),
                  color: Colors.white,
                  width: Adaptive.h(100),
                  height: Adaptive.h(100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[0],
                        style: GoogleFonts.lato(fontSize: 26),
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
                        "\$${data[4]}",
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
