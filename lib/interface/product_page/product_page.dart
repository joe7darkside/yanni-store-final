import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//? complete the product page as sliver
class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  Image.asset(
                    'assets/images/person.jpg',
                    fit: BoxFit.fill,
                    width: Adaptive.w(100),
                    height: Adaptive.h(50),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
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
              // title: const Text(
              //   'Sarah muhammed',
              //   textAlign: TextAlign.right,
              //   style: TextStyle(fontSize: 16),
              // ),
            ),
            expandedHeight: Adaptive.h(40),
            // leading: Text(
            //   'Sarah muhammed',
            //   textAlign: TextAlign.start,
            // ),
            backgroundColor: Colors.transparent,
            // backwardsCompatibility: false,
            // toolbarHeight: Adaptive.h(40),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                color: Colors.white,
                width: Adaptive.h(100),
                height: Adaptive.h(100),
              );
            },
            childCount:1
          ))
        ],
      )),
    );
  }
}
