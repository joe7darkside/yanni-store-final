import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yanni_store/accuonts/signin_controller.dart';
import 'package:yanni_store/utils/images.dart';

class ForgotPasswordPage extends StatelessWidget {
  final SignInController signInController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            SvgPicture.asset(
              sign_in_image,
              height: 220,
            ),
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
                        controller: signInController.email,
                        textInputAction: TextInputAction.done,
                        name: 'Email',
                        decoration: InputDecoration(labelText: "Email"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0.0, left: 80, right: 80),
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.indigo[700],
                        textColor: Colors.white,
                        elevation: 2.0,
                        child: Text("Send", style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            // signInController.signIn();
                          } else {
                            print("validation works");
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
