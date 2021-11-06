import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  var googleSignInAccount = Rx<GoogleSignInAccount?>(null);
  final email = TextEditingController();
  final password = TextEditingController();
  StreamSubscription<User?>? user;
  User? _user = auth.FirebaseAuth.instance.currentUser;
  @override
  void onInit() {
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    email.text = "";
    password.text = "";
    super.onInit();
  }

  // @override
  // void onClose() {
  //   // user.cancel();
  //   email.dispose();
  //   password.dispose();
  //   super.onClose();
  // }

  verifyEmail() async {
    if (_user != null && !_user!.emailVerified) {
      await _user!.sendEmailVerification();
      Get.toNamed('/verifying');

      print('Link sent to your email');
    } else {
      Get.toNamed('/homePage');
    }
  }

//Signout
  signout() async {
    try {
      await auth.FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      if (_user == null) {
        Get.offAllNamed(
          '/signIn',
        );
      }
    } catch (e) {
      print(e);
    }
  }

//Registration with email and password
  void create() async {
    try {
      auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) => verifyEmail());
    } on auth.FirebaseAuthException catch (e) {
      print(e);
    }
  }

//Registration with google
  Future signWithgoogle() async {
    try {
      googleSignInAccount.value = await GoogleSignIn().signIn();

      Get.toNamed('/homePage');
    } on auth.FirebaseAuthException catch (e) {
      print(e);
    }
  }

//Signin
  void signIn() async {
    try {
      auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.toNamed('/homePage');
    } on auth.FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
