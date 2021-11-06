import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yanni_store/accuonts/accuont_page.dart';
import 'package:yanni_store/accuonts/signin_controller.dart';
import 'package:yanni_store/utils/images.dart';

class SignInPage extends StatelessWidget {
  final SignInController signinController = Get.put(SignInController());
  final SignInController googleController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          child: Obx(() {
            if (googleController.googleAccunt.value == null) {
              return signInWidget(context);
            } else {
              return accountPage(context);
            }
          })),
    );
  }

  Widget accountPage(BuildContext context) {
    return AccuontPage();
  }

  ListView signInWidget(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        SvgPicture.asset(
          sign_in_image,
          height: 180,
        ),
        FormBuilder(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: signinController.formKey,
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
                    controller: signinController.email,
                    textInputAction: TextInputAction.next,
                    name: 'Email',
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 40, right: 40),
                  child: FormBuilderTextField(
                    keyboardType: TextInputType.visiblePassword,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 8),
                      FormBuilderValidators.maxLength(context, 50),
                    ]),
                    controller: signinController.password,
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
                          onPressed: () => Get.toNamed("/forget"),
                          child: Text(
                            "Forgot password ?",
                            style: TextStyle(color: Colors.indigo[700]),
                          ))
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0, left: 80, right: 80),
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.indigo[700],
                        textColor: Colors.white,
                        elevation: 2.0,
                        child: Text("Login", style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          signinController.formKey.currentState!.save();
                          if (signinController.formKey.currentState!
                              .validate()) {
                            signinController.signIn();
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
                    // Text(
                    //   "OR",
                    //   style: TextStyle(
                    //       color: Colors.grey[600],
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //       bottom: 10, left: 40, right: 40),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       // Container(
                    //       //   height: 52,
                    //       //   width: 150,
                    //       //   child: RaisedButton(
                    //       //     color: Colors.indigo,
                    //       //     textColor: Colors.white,
                    //       //     elevation: 2.0,
                    //       //     child: Row(
                    //       //       mainAxisAlignment: MainAxisAlignment.center,
                    //       //       children: [
                    //       //         FaIcon(FontAwesomeIcons.facebook),
                    //       //         SizedBox(
                    //       //           width: 7,
                    //       //         ),
                    //       //         Text("Facebook",
                    //       //             style: TextStyle(fontSize: 14)),
                    //       //       ],
                    //       //     ),
                    //       //     onPressed: () {},
                    //       //     shape: RoundedRectangleBorder(
                    //       //         borderRadius: BorderRadius.circular(25.0)),
                    //       //   ),
                    //       // ),
                    //       Row(
                    //         children: [
                    //           Container(
                    //             height: 50,
                    //             width: 55,
                    //             child: RaisedButton(
                    //               color: Colors.red,
                    //               textColor: Colors.white,
                    //               elevation: 2.0,
                    //               child: FaIcon(
                    //                 FontAwesomeIcons.google,
                    //                 size: 23,
                    //               ),
                    //               // SizedBox(
                    //               //   width: 7,
                    //               // ),
                    //               // Text("Google",
                    //               //     style: TextStyle(fontSize: 14)),

                    //               onPressed: () {
                    //                 googleController.logIn();
                    //               },
                    //               shape: RoundedRectangleBorder(
                    //                   borderRadius:
                    //                       BorderRadius.circular(25.0)),
                    //             ),
                    //           ),
                    //           SizedBox(
                    //             width: 10,
                    //           ),
                    //           Container(
                    //             height: 50,
                    //             width: 55,
                    //             child: RaisedButton(
                    //               color: Colors.blue[900],
                    //               textColor: Colors.white,
                    //               elevation: 2.0,
                    //               child: FaIcon(
                    //                 FontAwesomeIcons.facebook,
                    //                 size: 23,
                    //               ),
                    //               // SizedBox(
                    //               //   width: 7,
                    //               // ),
                    //               // Text("Google",
                    //               //     style: TextStyle(fontSize: 14)),

                    //               onPressed: () {},
                    //               shape: RoundedRectangleBorder(
                    //                   borderRadius:
                    //                       BorderRadius.circular(25.0)),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // TextButton(
                    //     onPressed: () => Get.toNamed('/sixteen'),
                    //     child: Text("Don't have account ?",
                    //         style: TextStyle(
                    //           color: Colors.indigo[700],
                    //         )))
                  ],
                ),
              ],
            )),
      ],
    );
  }
}
