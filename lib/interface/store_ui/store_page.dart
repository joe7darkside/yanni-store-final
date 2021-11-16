import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/products/dashboard/add/fetch_data_form_firebase.dart';
import 'package:yanni_store/products/get_product_data.dart';
import 'package:yanni_store/interface/store_ui/product_ui.dart';

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
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => print('works'),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/add.png',
                            // color: Colors.grey[800],
                            width: 35,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => print('works'),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/add.png',
                            // color: Colors.grey[800],
                            width: 35,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                    // height: 20,
                  ),
                  GestureDetector(
                    onTap: () => print('works'),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/add.png',
                            // color: Colors.grey[800],
                            width: 35,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                    // height: 20,
                  ),
                  GestureDetector(
                    onTap: () => print('works'),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/add.png',
                            // color: Colors.grey[800],
                            width: 35,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                    // height: 20,
                  ),
                  GestureDetector(
                    onTap: () => print('works'),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/add.png',
                            // color: Colors.grey[800],
                            width: 35,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                    // height: 20,
                  ),
                  GestureDetector(
                    onTap: () => print('works'),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/add.png',
                            // color: Colors.grey[800],
                            width: 35,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                    // height: 20,
                  ),
                  GestureDetector(
                    onTap: () => print('works'),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/add.png',
                            // color: Colors.grey[800],
                            width: 35,
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                    // height: 20,
                  ),
                  GestureDetector(
                    onTap: () => print('works'),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            'assets/images/add.png',
                            width: 35,
                          ),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Adaptive.h(1),
            ),
            Flexible(
                child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: productDataController.title.length,
              itemBuilder: (BuildContext context, int index) => StoreItemUi(
                title: productDataController.title[index],
                price: productDataController.price[index],
                likes: productDataController.likes[index],
                // images:[ productDataController.images.value[index]],
                category: productDataController.category[index],
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 2.8 : 2.8),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            )
                // GridView.builder(
                //   itemCount: 8,
                //   itemBuilder: (context, index) {
                //     return const ProductUi();
                //   },
                //   physics: const AlwaysScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   padding: const EdgeInsets.only(top: 20),
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     mainAxisExtent: Adaptive.h(34),
                //     crossAxisCount: 2,
                //   ),
                // ),
                )
          ],
        ),
      ),
    ));
  }
}
