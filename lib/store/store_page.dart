import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yanni_store/cards/card_model.dart';
import 'package:yanni_store/cards/custom_card.dart';
import 'package:yanni_store/products_data/firebase_store.dart';
import 'package:yanni_store/utils/images.dart';
import 'package:get/get.dart';

import 'search_bar_controller.dart';

class StorePage extends StatelessWidget {
  final SearchbarController controller = Get.put(SearchbarController());
  final FirebaseController fireController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchbarController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: controller.appBarTitle,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PopupMenuButton<int>(
                // color: Colors.white,
                onSelected: (item) => selectedItem(
                  context,
                  item,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.phoneVolume,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Contact us',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // PopupMenuItem(
                  //   value: 2,
                  //   child: Row(
                  //     children: [
                  //       FaIcon(
                  //         FontAwesomeIcons.redo,
                  //         color: morrell_color,
                  //       ),
                  //       SizedBox(
                  //         width: 12,
                  //       ),
                  //       Text(
                  //         'Refresh',
                  //         style: TextStyle(fontSize: 16),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.sort,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Sort',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.blue[900],
          elevation: 4.2,
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[900],
          child: controller.searchIcon,
          onPressed: () {
            fireController.addItem();
            // controller.searchBarChange();
          },
        ),
        body: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                    onPressed: () {
                      print("Filter");
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.sort,
                          // color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Filter",
                          // style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )),
                IconButton(
                    onPressed: () {
                      print("view changer");
                    },
                    icon: Icon(
                      Icons.view_column,
                      // color: Colors.black,
                    ))
              ],
            ),
            // GridView.builder(
            //     addAutomaticKeepAlives: false,
            //     physics: ScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: 10,
            //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //         maxCrossAxisExtent: 210.0,
            //         mainAxisExtent: 280,
            //         childAspectRatio: 1.2,
            //         crossAxisSpacing: 10,
            //         mainAxisSpacing: 10),
            //     itemBuilder: (context, index) {
            //       return StoreCustomCard(
            //         image: oud_image,
            //         title: '${controller.titles[index]}',
            //         price: "${controller.names[index]}",
            //         category: 'uuuuu',
            //       );
            //     }),
          ],
        ),
      );
    });
  }
}

selectedItem(
  context,
  item,
) {
  switch (item) {
    case 0:
      Get.toNamed("/ten");
      break;
    // case 2:
    //   controller.onRefresh();
    //   break;
    case 1:
      Get.defaultDialog(
          cancel: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          confirm: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
            onPressed: () {
              // if (controller.formKey.currentState.validate()) {
              //   controller.addNewIp();
              //   Get.back();
              // }
            },
            child: Text('Set'),
          ),
          title: '',
          content: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              // Container(
              //   height: 100,
              //   width: 250,
              //   margin: EdgeInsets.only(left: 10, right: 10),
              //   padding: EdgeInsets.only(top: 2, left: 8, right: 8),
              //   child: Form(
              //     key: controller.formKey,
              //     child: Column(
              //       children: [
              //         TextFormField(
              //           validator: controller.validate,
              //           keyboardType: TextInputType.number,
              //           controller: controller.newIp,
              //           decoration: const InputDecoration(
              //               fillColor: Color.fromRGBO(100, 33, 101, 1),
              //               labelText: 'Device IP',
              //               labelStyle: TextStyle(
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.w600,
              //                   color: Color.fromRGBO(100, 33, 101, 1))),
              //           // validator: value.locationValidator,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Positioned(
              //     top: -100,
              //     child: CircleAvatar(
              //       backgroundColor: Colors.grey[300],
              //       radius: 45,
              //       child: SvgPicture.asset(switchIcon3),
              //     )),
            ],
          ));
  }
}
