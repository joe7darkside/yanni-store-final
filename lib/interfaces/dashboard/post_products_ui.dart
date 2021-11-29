import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/controllers/post_products_logic.dart';
import 'package:yanni_store/utils/images.dart';

class PostProduct extends StatelessWidget {
  final PostProductController postProductController =
      Get.put(PostProductController());
  final _labelStyle = GoogleFonts.lato(
    fontSize: Adaptive.sp(18),
    fontWeight: FontWeight.w400,
  );
  final _constraints = BoxConstraints(
      maxHeight: Adaptive.h(7),
      minHeight: Adaptive.h(7),
      maxWidth: Adaptive.w(80),
      minWidth: Adaptive.w(80));
  final _border = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(15),
  );
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    final _validation = FormBuilderValidators.compose([
      FormBuilderValidators.required(context),
      FormBuilderValidators.email(context),
      FormBuilderValidators.maxLength(context, 50),
    ]);
    return SafeArea(
        child: Obx(
      () => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => postProductController.getImage(true),
          child: const Icon(FontAwesomeIcons.images),
          backgroundColor: const Color.fromRGBO(0, 191, 166, 1),
        ),
        body: ListView(
          children: [
            SizedBox(height: Adaptive.h(7)),
            postProductController.image.isEmpty
                ? SvgPicture.asset(
                    postItemImage,
                    width: Adaptive.w(50),
                  )
                : Image.file(
                    postProductController.image[0],
                    // width: Adaptive.w(20),
                    height: Adaptive.w(50),
                  ),
            FormBuilder(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    bottom: 10,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          keyboardType: TextInputType.text,
                          validator: _validation,
                          controller: postProductController.title,
                          textInputAction: TextInputAction.next,
                          name: 'title',
                          decoration: InputDecoration(
                            labelStyle: _labelStyle,
                            fillColor: Colors.grey[300],
                            filled: true,
                            labelText: "Title",
                            border: _border,
                            constraints: _constraints,
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        FormBuilderTextField(
                          keyboardType: TextInputType.number,
                          validator: _validation,
                          controller: postProductController.price,
                          textInputAction: TextInputAction.next,
                          name: 'price',
                          decoration: InputDecoration(
                            labelStyle: _labelStyle,
                            border: _border,
                            constraints: _constraints,
                            fillColor: Colors.grey[300],
                            filled: true,
                            labelText: "Price",
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        FormBuilderTextField(
                          keyboardType: TextInputType.multiline,
                          validator: _validation,
                          controller: postProductController.descraption,
                          textInputAction: TextInputAction.newline,
                          name: 'description',
                          decoration: InputDecoration(
                            labelStyle: _labelStyle,
                            border: _border,
                            constraints: _constraints,
                            fillColor: Colors.grey[300],
                            filled: true,
                            labelText: "Description",
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        FormBuilderTextField(
                          keyboardType: TextInputType.text,
                          validator: _validation,
                          controller: postProductController.category,
                          textInputAction: TextInputAction.done,
                          name: 'category',
                          decoration: InputDecoration(
                            labelStyle: _labelStyle,
                            border: _border,
                            constraints: _constraints,
                            fillColor: Colors.grey[300],
                            filled: true,
                            labelText: "Category",
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        ElevatedButton(
                          onPressed: () => postProductController.saveImages(),
                          child: Text(
                            'Create',
                            style: GoogleFonts.lato(
                                fontSize: Adaptive.sp(20),
                                fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(
                                  Size(Adaptive.w(80), Adaptive.h(6))),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: const BorderSide(
                                      width: 2.5,
                                      color: Color.fromRGBO(0, 191, 166, 1)),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(0, 191, 166, 1))),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
