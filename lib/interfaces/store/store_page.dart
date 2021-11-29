import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:yanni_store/controllers/category_controller.dart';
import 'package:yanni_store/controllers/get_products.dart';
import 'package:yanni_store/widgets/product/product_card.dart';
import 'package:yanni_store/utils/images.dart';
import '../../widgets/category_items_selecter/category_item_selecter.dart';

//! fix category scroll issues
class StoreScreen extends StatelessWidget {
  GetProductsController productDataController =
      Get.put(GetProductsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child:
            // ListView(
            //   children: [
            // Flexible(child: HorizList()),
            StaggeredGridView.countBuilder(
          addAutomaticKeepAlives: true,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          crossAxisCount: 4,
          itemCount: productDataController.title.length,
          itemBuilder: (BuildContext context, int index) => ProductCard(
            number: index,
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
          shrinkWrap: true,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          //   ),
          // ],
        ),
      ),
    ));
  }
}

class HorizList extends StatelessWidget {
  final AnimationCategoryController _categoryController =
      Get.put(AnimationCategoryController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimationCategoryController>(
        builder: (AnimationCategoryController) {
      return SizedBox(
        height: 100,
        child: ListView.builder(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
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
    });
  }
}
