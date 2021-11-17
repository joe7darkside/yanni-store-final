import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:yanni_store/products/dashboard/add/fetch_data_form_firebase.dart';
import 'package:yanni_store/interface/store_ui/products/product_ui.dart';
import 'package:yanni_store/utils/images.dart';
import 'categories/category_item_selecter.dart';

class StorePage extends StatelessWidget {
  FetchDataFromFirebase productDataController =
      Get.put(FetchDataFromFirebase());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            Flexible(child: HorizList()),
            // SizedBox(
            //   height: Adaptive.h(0),
            // ),
            Flexible(
                child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: productDataController.title.length,
              itemBuilder: (BuildContext context, int index) => ItemCard(
                rating: productDataController.rating[index],
                descraption: productDataController.descraption[index],
                title: productDataController.title[index],
                price: productDataController.price[index],
                likes: productDataController.likes[index],
                images: productDataController.images[index][0],
                category: productDataController.category[index],
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 2.8 : 2.8),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ))
          ],
        ),
      ),
    ));
  }
}

class HorizList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: categoryIcons.length,
        itemBuilder: (context, index) {
          return CategoryItemsSelecter(
            image: categoryIcons[index],
            onClick: index,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
