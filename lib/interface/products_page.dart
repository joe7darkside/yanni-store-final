import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/products/product_ui.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leadingWidth: Adaptive.w(40),
      //   toolbarHeight: 70,
      //   backgroundColor: Colors.white,
      //   elevation: 0.1,
      //   leading: Padding(
      //     padding: const EdgeInsets.only(left: 4, top: 2, bottom: 2),
      //     child: Row(
      //       children: const [
      //         // Image.asset(
      //         //   'assets/guitar.png',
      //         //   width: 60,
      //         //   height: 60,
      //         // ),
      //         // Spacer(),
      //         // Text(
      //         //   "Yanni\nStore",
      //         //   style: TextStyle(
      //         //       color: Colors.blue[900],
      //         //       fontSize: 20,
      //         //       fontWeight: FontWeight.w700),
      //         // )
      //       ],
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.all(10.0),
      //       child: IconButton(
      //           onPressed: () {},
      //           icon: IconButton(
      //             onPressed: () {},
      //             icon: const Icon(FontAwesomeIcons.slidersH),
      //             color: Colors.blue[900],
      //           )),
      //     ),
      //     // Padding(
      //     //   padding: const EdgeInsets.all(10.0),
      //     //   child: IconButton(
      //     //       onPressed: () {},
      //     //       icon: IconButton(
      //     //         onPressed: () {},
      //     //         icon: const Icon(
      //     //           Icons.shopping_cart_outlined,
      //     //           size: 30,
      //     //         ),
      //     //         color: Colors.blue[700],
      //     //       )),
      //     // )
      //   ],
      // ),
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

            // Container(
            // padding: EdgeInsets.only(top: 20),
            //     margin: EdgeInsets.only(top: 10),
            //     width: Adaptive.w(100),
            //     height: Adaptive.h(100),
            //     child: GridView.count(
            //       padding: EdgeInsets.only(top: 20),
            //       physics: ScrollPhysics(),
            //       shrinkWrap: true,
            //       crossAxisCount: 2,
            //       crossAxisSpacing: 0.0,
            //       mainAxisSpacing: 60.0,
            //       children: List.generate(
            //         8,
            //         (index) {
            //           return const Center(
            //             child: ProductUi(),

            //           );
            //         },
            //         growable: true,
            //       ),
            //     )
            SizedBox(
              height: Adaptive.h(1),
            ),
            Flexible(
                child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) => ProductUi(),
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
