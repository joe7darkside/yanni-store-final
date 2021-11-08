import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/auth/auth_controller.dart';

class SignInPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.fill),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60))),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                    margin: EdgeInsets.only(top: 140, bottom: 10.0),
                    width: Adaptive.w(84),
                    height: Adaptive.h(60),
                    decoration: const BoxDecoration(
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
                        child: SingleChildScrollView(
                          child: Column(
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
                                    FormBuilderValidators.maxLength(
                                        context, 50),
                                  ]),
                                  controller: authController.email,
                                  textInputAction: TextInputAction.next,
                                  name: 'Email',
                                  decoration:
                                      InputDecoration(labelText: "Email"),
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
                                    FormBuilderValidators.maxLength(
                                        context, 50),
                                  ]),
                                  controller: authController.password,
                                  textInputAction: TextInputAction.done,
                                  name: 'Password',
                                  decoration:
                                      InputDecoration(labelText: "Password"),
                                ),
                              ),
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12),
                                    child: TextButton(
                                        onPressed: () => Get.toNamed("/forget"),
                                        child: Text(
                                          "Forgot your password?",
                                          style: TextStyle(
                                              color: Colors.grey[700]),
                                        )),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: FlatButton(
                                  textColor: Colors.grey[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: Colors.red),
                                  ),
                                  onPressed: () => authController.signIn(),
                                  child: Text("SIGNIN"),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'OR',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 25, right: 25),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      child: Image.asset(
                                        'assets/social/search.png',
                                        width: 40,
                                      ),
                                      onTap: () =>
                                          authController.signWithgoogle(),
                                    ),
                                    GestureDetector(
                                      child: Image.asset(
                                        'assets/social/apple.png',
                                        width: 40,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Image.asset(
                                        'assets/social/facebook.png',
                                        width: 40,
                                      ),
                                    )
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                ),
                              ),
                              SizedBox(
                                height: Adaptive.h(1),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: GoogleFonts.lato(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextButton(
                                    onPressed: () =>Get.toNamed("/sixteen"),
                                    child: Text(
                                      "Sign up",
                                      style: GoogleFonts.lato(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))),
              ),
            ],
          ),
          SizedBox(
            height: Adaptive.h(4),
          ),
        ],
      ),
    ));
  }
}
