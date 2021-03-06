import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yanni_store/controllers/animation_controller.dart';
import 'package:yanni_store/controllers/category_controller.dart';
import 'package:yanni_store/widgets/circular_button/circular_button.dart';
import 'package:yanni_store/widgets/dashboard_items/dashboard_item_card.dart';
import 'package:yanni_store/utils/images.dart';
import 'package:yanni_store/widgets/product/product_card.dart';
import '../../controllers/get_products.dart';

class DashboardScreen extends StatelessWidget {
  GetProductsController productDataController =
      Get.put(GetProductsController());
  final AnimationsController animationsController =
      Get.put(AnimationsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: GetBuilder<AnimationsController>(
              builder: (AnimationsController) {
                return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                        animationsController.getRadiosFromDegree(
                            animationsController.rotationController!.value)),
                    child: FloatingActionButton(
                      child: Icon(FontAwesomeIcons.plus),
                      // color: Colors.blue,
                      // height: 60,
                      // width: 60,
                      // icon: const Icon(
                      //   FontAwesomeIcons.plus,
                      //   color: Colors.white,
                      // ),
                      onPressed: () {
                        if (animationsController
                            .animationControllers!.isCompleted) {
                          animationsController.animationControllers?.reverse();
                        } else {
                          animationsController.animationControllers?.forward();
                        }
                        Get.toNamed('/PostProduct');
                      },
                    ));
              },
              init: AnimationsController(),
            ),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  Flexible(child: HorizList()),
                  const Divider(
                    thickness: 2,
                  ),
                  Flexible(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: StaggeredGridView.countBuilder(
                        scrollDirection: Axis.vertical,
                        // addAutomaticKeepAlives: true,
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        crossAxisCount: 4,
                        itemCount: productDataController.title.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ItemCards(
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
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                      ),
                    ),
                  ),
                ],
              ),
            )));
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

class CategoryItemsSelecter extends StatelessWidget {
  AnimationCategoryController categoriesController =
      Get.put(AnimationCategoryController());
  CategoryItemsSelecter({Key? key, required this.onClick, required this.image})
      : super(key: key);
  final String? image;
  final int? onClick;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnimationCategoryController>(
        builder: (AnimationCategoryController) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
        margin: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(
          border: categoriesController.selected == onClick
              ? Border.all(color: Colors.blue[900]!)
              : Border.all(color: Colors.black12),
          shape: BoxShape.rectangle,
          boxShadow: [
            categoriesController.selected == onClick
                ? BoxShadow(
                    offset: Offset.infinite,
                    blurRadius: 9.2,
                    color: Colors.blue[100]!,
                    spreadRadius: 1.5)
                : const BoxShadow(
                    color: Colors.black,
                  ),
            BoxShadow(
                blurRadius: 1.5, color: Colors.grey[200]!, spreadRadius: 1.5)
          ],
          borderRadius: BorderRadius.circular(15),
          color: categoriesController.selected == onClick
              ? Colors.blue[800]
              : null,
        ),
        height: categoriesController.selected == onClick ? 80 : 50,
        width: categoriesController.selected == onClick ? 75 : 50,
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              categoriesController.onSelected(onClick!);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: onClick == 0
                  ? Center(
                      child: Text(
                      '$image',
                      style: GoogleFonts.lato(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: categoriesController.selected == onClick
                            ? Colors.white
                            : Colors.black,
                      ),
                    ))
                  : Image.asset(
                      "$image",
                      color: categoriesController.selected == onClick
                          ? Colors.white
                          : Colors.black,
                      // width: 50,
                      // height: 50,
                      fit: BoxFit.contain,
                    ),
            )),
      );
    });
  }
}
