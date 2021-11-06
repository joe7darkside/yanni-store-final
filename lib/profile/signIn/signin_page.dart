import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yanni_store/products_data/firebase_store.dart';
import 'package:yanni_store/utils/images.dart';

import '../../connection_controller.dart';
import '../registration/auth_controller.dart';

class SignIn extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final FirebaseController controller = Get.put(FirebaseController());
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: () {
        //   controller.addItem();
        // }),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                width: Adaptive.w(100),
                height: Adaptive.h(40),
                // width: Adaptive.w(50),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(profile_bg), fit: BoxFit.fill),
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                    margin: EdgeInsets.only(top: 140, bottom: 10.0),
                    width: Adaptive.w(84),
                    height: Adaptive.h(45),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: FormBuilder(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 10, left: 25, right: 25),
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
                                top: 10, bottom: 10, left: 25, right: 25),
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
                              decoration:
                                  InputDecoration(labelText: "Password"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 95),
                            child: TextButton(
                                onPressed: () => Get.toNamed("/forget"),
                                child: Text(
                                  "Forgot your password?",
                                  style: TextStyle(color: Colors.grey[700]),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          // Spacer(),
                          Divider(
                            height: 0,
                            thickness: 2.5,
                            color: Colors.redAccent,
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed("/forget"),
                            child: Text(
                              "SIGN IN",
                              style: GoogleFonts.lato(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: Adaptive.h(3),
                          )
                        ],
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: Adaptive.h(4),
          ),
          Container(
              // margin: EdgeInsets.only(top: 140, bottom: 10.0),
              width: Adaptive.w(60),
              height: Adaptive.h(6),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.7),
                      blurRadius: 4.0,
                    ),
                  ],
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: Adaptive.w(2),
                    ),
                    Text(
                      'Connect With Facebook',
                      style: GoogleFonts.lato(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: Adaptive.h(2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: GoogleFonts.lato(
                    color: Colors.grey[600], fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Sign up",
                  style: GoogleFonts.lato(
                      color: Colors.grey[800], fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    )
        //   ListView(
        // children: [
        //   SizedBox(
        //     height: 30,
        //   ),
        //   // SvgPicture.asset(
        //   //   login_image,
        //   //   height: Adaptive.h(28),
        //   // ),
        //   FormBuilder(
        //       autovalidateMode: AutovalidateMode.onUserInteraction,
        //       key: _formKey,
        //       child: Column(
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.only(
        //                 top: 20, bottom: 10, left: 40, right: 40),
        //             child: FormBuilderTextField(
        //               keyboardType: TextInputType.emailAddress,
        //               validator: FormBuilderValidators.compose([
        //                 FormBuilderValidators.required(context),
        //                 FormBuilderValidators.email(context),
        //                 FormBuilderValidators.maxLength(context, 50),
        //               ]),
        //               controller: authController.email,
        //               textInputAction: TextInputAction.next,
        //               name: 'Email',
        //               decoration: InputDecoration(labelText: "Email"),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(
        //                 top: 10, bottom: 10, left: 40, right: 40),
        //             child: FormBuilderTextField(
        //               keyboardType: TextInputType.visiblePassword,
        //               validator: FormBuilderValidators.compose([
        //                 FormBuilderValidators.required(context),
        //                 FormBuilderValidators.minLength(context, 8),
        //                 FormBuilderValidators.maxLength(context, 50),
        //               ]),
        //               controller: authController.password,
        //               textInputAction: TextInputAction.done,
        //               name: 'Password',
        //               decoration: InputDecoration(labelText: "Password"),
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.only(right: 30),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 TextButton(
        //                     onPressed: () => Get.toNamed('/forgotPassword'),
        //                     child: Text(
        //                       "Forgot password ?",
        //                       style: TextStyle(color: Colors.indigo[700]),
        //                     ))
        //               ],
        //             ),
        //           ),
        //           Column(
        //             children: [
        //               Container(
        //                 margin: EdgeInsets.only(top: 0.0, left: 80, right: 80),
        //                 height: 50,
        //                 width: double.infinity,
        //                 child: RaisedButton(
        //                   color: Colors.indigo[700],
        //                   textColor: Colors.white,
        //                   elevation: 2.0,
        //                   child: Text("Log in", style: TextStyle(fontSize: 18)),
        //                   onPressed: () {
        //                     _formKey.currentState!.save();
        //                     if (_formKey.currentState!.validate() &&
        //                         connectivityController.connectionStatus.value ==
        //                             true) {
        //                       authController.signIn();
        //                     } else {
        //                       print("validation works");
        //                     }
        //                   },
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(25.0)),
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 15,
        //               ),
        //               Text(
        //                 "OR",
        //                 style: TextStyle(
        //                     color: Colors.grey[600],
        //                     fontSize: 15,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.only(
        //                     bottom: 10, left: 40, right: 40),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: [
        //                     // Container(
        //                     //   height: 52,
        //                     //   width: 150,
        //                     //   child: RaisedButton(
        //                     //     color: Colors.indigo,
        //                     //     textColor: Colors.white,
        //                     //     elevation: 2.0,
        //                     //     child: Row(
        //                     //       mainAxisAlignment: MainAxisAlignment.center,
        //                     //       children: [
        //                     //         FaIcon(FontAwesomeIcons.facebook),
        //                     //         SizedBox(
        //                     //           width: 7,
        //                     //         ),
        //                     //         Text("Facebook",
        //                     //             style: TextStyle(fontSize: 14)),
        //                     //       ],
        //                     //     ),
        //                     //     onPressed: () {},
        //                     //     shape: RoundedRectangleBorder(
        //                     //         borderRadius: BorderRadius.circular(25.0)),
        //                     //   ),
        //                     // ),
        //                     Container(
        //                       height: 52,
        //                       width: 150,
        //                       child: RaisedButton(
        //                         color: Colors.red,
        //                         textColor: Colors.white,
        //                         elevation: 2.0,
        //                         child: Row(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: [
        //                             FaIcon(FontAwesomeIcons.google),
        //                             SizedBox(
        //                               width: 7,
        //                             ),
        //                             Text("Google",
        //                                 style: TextStyle(fontSize: 14)),
        //                           ],
        //                         ),
        //                         onPressed: () {
        //                           if (connectivityController
        //                               .connectionStatus.value) {
        //                             authController.signWithgoogle();
        //                           }
        //                         },
        //                         shape: RoundedRectangleBorder(
        //                             borderRadius: BorderRadius.circular(25.0)),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               TextButton(
        //                   onPressed: () => Get.to(RegistrationPage()),
        //                   child: Text("Don't have account ?",
        //                       style: TextStyle(
        //                         color: Colors.indigo[700],
        //                       )))
        //             ],
        //           ),
        //         ],
        //       )),
        // ],
        // )
        );
  }
}
