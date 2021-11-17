import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/products/rating_star/raing_controller.dart';
import 'package:yanni_store/products/rating_star/rating_star.dart';

//? complete the product page as sliver
class ProductPage extends StatelessWidget {
  final RatingController ratingController = Get.put(RatingController());
  final List data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print(data[3]);
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
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
                      children: const [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 30,
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
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
                  SizedBox(
                    height: 8,
                  ),
                  SmoothStarRating(
                        rating: data[6],
                        allowHalfRating: true,
                        color: Colors.orange,
                        borderColor: Colors.orange,
                        starCount:5 ,
                        spacing: 2,
                        // onRatingChanged: (double rate) {
                        //   // ratingController.rate();
                        //   print(rate);
                        // },
                      ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "\$${data[4]}",
                    style: GoogleFonts.lato(fontSize: 20, color: Colors.blue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Product Details',
                    style: GoogleFonts.lato(fontSize: 26),
                  ),
                  Text(
                    data[5],
                    style: GoogleFonts.lato(fontSize: 26),
                  ),
                ],
              ),
            );
          }, childCount: 1))
        ],
      )),
    );
  }
}
