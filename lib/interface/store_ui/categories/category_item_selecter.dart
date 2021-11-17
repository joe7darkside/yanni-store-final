import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'categories_controller.dart';

class CategoryItemsSelecter extends StatelessWidget {
  CategoriesController categoriesController = Get.put(CategoriesController());
  CategoryItemsSelecter({Key? key, required this.onClick, required this.image})
      : super(key: key);
  final String? image;
  final int? onClick;
  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => categoriesController.onSelected(onClick!),
        child: Card(
            color: categoriesController.selected.value == onClick
                ? Colors.blue
                : null,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: onClick == 0
                  ? Center(
                      child: Text(
                      '$image',
                      style: GoogleFonts.lato(fontSize: 22,fontWeight: FontWeight.w400),
                    ))
                  : Image.asset("$image"),
            ))));
  }
}
