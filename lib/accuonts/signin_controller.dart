import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  var _googleSign = GoogleSignIn();
  var googleAccunt = Rx<GoogleSignInAccount?>(null);
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userPhoto = ''.obs;
  var userToken;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();
  @override
  void onInit() {
    email.text = "";
    password.text = "";
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  googlelogIn() async {
    try {
      googleAccunt.value = await _googleSign.signIn();
      userName.value = _googleSign.currentUser!.displayName!;
      userEmail.value = _googleSign.currentUser!.email;
      userPhoto.value = _googleSign.currentUser!.photoUrl!;
    } on PlatformException catch (e) {
      print(e);
    }
  }

  googlelogOut() async {
    try {
      googleAccunt.value = await _googleSign.signOut();
    } on PlatformException catch (e) {
      print(e);
    }
  }

  signIn() async {
    try {
      auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }

  create() async {
    try {
      auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }
}
