import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'product_container.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormBuilderState>();

    return SafeArea(
        child: Scaffold(

            // backgroundColor: Colors.white,
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
            // body: Padding(
            //   padding: const EdgeInsets.only(top: 15),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         child: Row(
            //           children: [
            //             const SizedBox(
            //               width: 10,
            //               // height: 20,
            //             ),
            //             GestureDetector(
            //               onTap: () => print('works'),
            //               child: Card(
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(10)),
            //                   color: Colors.blue,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: Image.asset(
            //                       'assets/images/22.jpg',
            //                       color: Colors.grey[800],
            //                       width: 35,
            //                     ),
            //                   )),
            //             ),
            //             const SizedBox(
            //               width: 10,
            //               // height: 20,
            //             ),
            //             GestureDetector(
            //               onTap: () => print('works'),
            //               child: Card(
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(10)),
            //                   color: Colors.blue,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: Image.asset(
            //                       'assets/violin.png',
            //                       color: Colors.grey[800],
            //                       width: 35,
            //                     ),
            //                   )),
            //             ),
            //             const SizedBox(
            //               width: 10,
            //               // height: 20,
            //             ),
            //             GestureDetector(
            //               onTap: () => print('works'),
            //               child: Card(
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(10)),
            //                   color: Colors.blue,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: Image.asset(
            //                       'assets/images/22.jpg',
            //                       color: Colors.grey[800],
            //                       width: 35,
            //                     ),
            //                   )),
            //             ),
            //             const SizedBox(
            //               width: 10,
            //               // height: 20,
            //             ),
            //             GestureDetector(
            //               onTap: () => print('works'),
            //               child: Card(
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(10)),
            //                   color: Colors.blue,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: Image.asset(
            //                       'assets/images/22.jpg',
            //                       color: Colors.grey[800],
            //                       width: 35,
            //                     ),
            //                   )),
            //             ),
            //             const SizedBox(
            //               width: 10,
            //               // height: 20,
            //             ),
            //             GestureDetector(
            //               onTap: () => print('works'),
            //               child: Card(
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(10)),
            //                   color: Colors.blue,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: Image.asset(
            //                       'assets/images/22.jpg',
            //                       color: Colors.grey[800],
            //                       width: 35,
            //                     ),
            //                   )),
            //             ),
            //             const SizedBox(
            //               width: 10,
            //               // height: 20,
            //             ),
            //             GestureDetector(
            //               onTap: () => print('works'),
            //               child: Card(
            //                   shape: RoundedRectangleBorder(
            //                       borderRadius: BorderRadius.circular(10)),
            //                   color: Colors.blue,
            //                   child: Padding(
            //                     padding: const EdgeInsets.all(10.0),
            //                     child: Image.asset(
            //                       'assets/images/22.jpg',
            //                       color: Colors.grey[800],
            //                       width: 35,
            //                     ),
            //                   )),
            //             )
            //           ],
            //         ),
            //       )
            //       // Row(
            //       //   children: [
            //       //     ElevatedButton(
            //       //         style: ButtonStyle(
            //       //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       //                 const RoundedRectangleBorder(
            //       //                     borderRadius: BorderRadius.zero,
            //       //                     side: BorderSide(
            //       //                         color: Colors.black54, width: 0.4))),
            //       //             backgroundColor: MaterialStateProperty.all(Colors.white),
            //       //             elevation: MaterialStateProperty.all(0),
            //       //             fixedSize: MaterialStateProperty.all(
            //       //                 Size(Adaptive.w(50), Adaptive.h(7)))),
            //       //         onPressed: () {},
            //       //         child: Row(
            //       //           crossAxisAlignment: CrossAxisAlignment.center,
            //       //           mainAxisAlignment: MainAxisAlignment.center,
            //       //           children: const [
            //       //             Icon(
            //       //               Icons.filter_list_outlined,
            //       //               color: Colors.black,
            //       //               size: 30,
            //       //             ),
            //       //             Text(
            //       //               "Filter",
            //       //               style: TextStyle(
            //       //                 fontSize: 20,
            //       //                 color: Colors.black,
            //       //               ),
            //       //             )
            //       //           ],
            //       //         )),
            //       //     ElevatedButton(
            //       //         style: ButtonStyle(
            //       //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //       //                 const RoundedRectangleBorder(
            //       //                     borderRadius: BorderRadius.zero,
            //       //                     side: BorderSide(
            //       //                         color: Colors.black54, width: 0.4))),
            //       //             backgroundColor: MaterialStateProperty.all(Colors.white),
            //       //             elevation: MaterialStateProperty.all(0),
            //       //             fixedSize: MaterialStateProperty.all(
            //       //                 Size(Adaptive.w(50), Adaptive.h(7)))),
            //       //         onPressed: () {},
            //       //         child: Row(
            //       //           crossAxisAlignment: CrossAxisAlignment.center,
            //       //           mainAxisAlignment: MainAxisAlignment.center,
            //       //           children: const [
            //       //             Icon(
            //       //               Icons.sort_rounded,
            //       //               color: Colors.black,
            //       //               size: 30,
            //       //             ),
            //       //             Text(
            //       //               "Sort",
            //       //               style: TextStyle(
            //       //                 fontSize: 20,
            //       //                 color: Colors.black,
            //       //               ),
            //       //             )
            //       //           ],
            //       //         )),
            //       //   ],
            //       // ),
            //       // FormBuilder(
            //       //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //       //   key: _formKey,
            //       //   child: Padding(
            //       //     padding: const EdgeInsets.only(
            //       //         top: 10, bottom: 10, left: 15, right: 15),
            //       //     child: FormBuilderTextField(
            //       //       keyboardType: TextInputType.text,
            //       //       validator: FormBuilderValidators.compose([
            //       //         // FormBuilderValidators.required(context),
            //       //         // FormBuilderValidators.email(context),
            //       //         FormBuilderValidators.maxLength(context, 50),
            //       //       ]),
            //       //       // controller: authController.email,
            //       //       textInputAction: TextInputAction.next,
            //       //       name: 'Search',
            //       //       decoration: InputDecoration(
            //       //           fillColor: Colors.grey[200],
            //       //           filled: true,
            //       //           labelText: "What are you looking for?",
            //       //           border: InputBorder.none),
            //       //     ),
            //       //   ),
            //       // ),
            //       // Padding(
            //       //   padding: const EdgeInsets.all(10.0),
            //       //   child: Text(
            //       //     'Showing 1 to 20 of 20 total',
            //       //     style: TextStyle(
            //       //         fontWeight: FontWeight.bold, color: Colors.grey[700]),
            //       //   ),
            //       // ),
            //       ,
            //       Flexible(
            //         child: StaggeredGridView.countBuilder(
            //           padding: EdgeInsets.all(10),
            //           shrinkWrap: true,
            //           // physics:
            //           //     const ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            //           crossAxisCount: 4,
            //           itemCount: 8,
            //           itemBuilder: (BuildContext context, int index) =>
            //               const CustemItemContainer(),
            //           staggeredTileBuilder: (int index) =>
            //               StaggeredTile.count(2, index.isEven ? 2.68 : 2.68),
            //           mainAxisSpacing: 15.0,
            //           crossAxisSpacing: 7.0,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            ));
  }
}
