import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddProduct extends StatelessWidget {
  // const AddProduct({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(height: Adaptive.h(7)),
            SvgPicture.asset(
              'assets/images/add.svg',
              width: 220,
            ),
            FormBuilder(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 35, right: 35),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          keyboardType: TextInputType.name,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            // FormBuilderValidators.email(context),
                            FormBuilderValidators.maxLength(context, 20),
                          ]),
                          // controller: authController.name,
                          textInputAction: TextInputAction.next,
                          name: 'Full Name',
                          decoration: const InputDecoration(
                              labelText: "FullName",
                              border: OutlineInputBorder()),
                        ),
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        FormBuilderTextField(
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.email(context),
                            FormBuilderValidators.maxLength(context, 50),
                          ]),
                          // controller: authController.email,
                          textInputAction: TextInputAction.next,
                          name: 'Email',
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            // enabledBorder: InputBorder.none,
                            constraints: BoxConstraints(
                                maxHeight: Adaptive.h(7),
                                minHeight: Adaptive.h(7),
                                maxWidth: Adaptive.w(90),
                                minWidth: Adaptive.w(80)),
                            fillColor: Colors.grey[300],
                            filled: true,
                            labelText: "Email",
                            // border: const OutlineInputBorder(
                            //     borderSide: BorderSide(
                            //       color: Colors.blue,
                            //       width: 0.0,
                            //       style: BorderStyle.none,
                            //     ),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(15.0)))
                          ),
                        ),
                        SizedBox(
                          height: Adaptive.h(3),
                        ),
                        FormBuilderTextField(
                          keyboardType: TextInputType.visiblePassword,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.minLength(context, 8),
                            FormBuilderValidators.maxLength(context, 50),
                          ]),
                          // controller: authController.password,
                          textInputAction: TextInputAction.done,
                          name: 'Password',
                          decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            textColor: Colors.grey[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(color: Colors.red),
                            ),
                            onPressed: () => null,
                            child: Text("Create"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
