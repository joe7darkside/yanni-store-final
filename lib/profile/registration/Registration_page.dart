import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../connection_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'auth_controller.dart';

class RegistrationPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        // appBar: customAppBar(),
        body: Container(
            width: double.infinity,
            child: ListView(
              children: [
                SizedBox(
                  height: 30,
                ),
                // SvgPicture.asset(
                //   create_image,
                //   height: 220,
                // ),
                FormBuilder(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 10, left: 40, right: 40),
                          child: FormBuilderTextField(
                            keyboardType: TextInputType.emailAddress,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.email(context),
                              FormBuilderValidators.maxLength(context, 50),
                            ]),
                            controller: authController.email,
                            textInputAction: TextInputAction.next,
                            name: 'Email',
                            decoration: InputDecoration(labelText: "Email"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 40, right: 40),
                          child: FormBuilderTextField(
                            keyboardType: TextInputType.visiblePassword,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.minLength(context, 8),
                              FormBuilderValidators.maxLength(context, 50),
                            ]),
                            controller: authController.password,
                            textInputAction: TextInputAction.done,
                            name: 'Password',
                            decoration: InputDecoration(labelText: "Password"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () => Get.toNamed('/signIn'),
                                  child: Text(
                                    "Already have account ?",
                                    style: TextStyle(color: Colors.indigo[700]),
                                  ))
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  top: 0.0, left: 80, right: 80),
                              height: 50,
                              width: double.infinity,
                              child: RaisedButton(
                                color: Colors.indigo[700],
                                textColor: Colors.white,
                                elevation: 2.0,
                                child: Text("Sign up",
                                    style: TextStyle(fontSize: 18)),
                                onPressed: () {
                                  _formKey.currentState!.save();
                                  if (_formKey.currentState!.validate() &&
                                      connectivityController
                                          .connectionStatus.value) {
                                    authController.create();
                                  } else {
                                    print("validation works");
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "OR",
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10, left: 40, right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Container(
                                  //   height: 52,
                                  //   width: 140,
                                  //   child: RaisedButton(
                                  //     color: Colors.indigo,
                                  //     textColor: Colors.white,
                                  //     elevation: 2.0,
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.center,
                                  //       children: [
                                  //         FaIcon(FontAwesomeIcons.facebook),
                                  //         SizedBox(
                                  //           width: 7,
                                  //         ),
                                  //         Text("Facebook",
                                  //             style: TextStyle(fontSize: 14)),
                                  //       ],
                                  //     ),
                                  //     onPressed: () {},
                                  //     shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(25.0)),
                                  //   ),
                                  // ),
                                  Container(
                                    height: 52,
                                    width: 150,
                                    child: RaisedButton(
                                      color: Colors.red[600],
                                      textColor: Colors.white,
                                      elevation: 2.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(FontAwesomeIcons.google),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Google",
                                              style: TextStyle(fontSize: 14)),
                                        ],
                                      ),
                                      onPressed: () {
                                        if (connectivityController
                                            .connectionStatus.value) {
                                          authController.signWithgoogle();
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ],
            )));
  }
}
