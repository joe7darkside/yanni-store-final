import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'errors_handler/error_haandler.dart';

class AuthController extends GetxController {
  var googleSignInAccount = Rx<GoogleSignInAccount?>(null);
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;

  var isLogin = false.obs;
  StreamSubscription<User?>? user;
  final User? _user = auth.FirebaseAuth.instance.currentUser;
  @override
  void onInit() {
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        isLogin.value = false;
        print('User is currently signed out!');
      } else {
        isLogin.value = true;
        userName = RxString(_user!.displayName!);
        userEmail = RxString(_user!.email!);
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
      // if (_user == null) {
      //   Get.offAllNamed(
      //     '/signIn',
      //   );
      // }
    } catch (e) {
      print(e);
    }
  }

//Registration with email and password
  void create() async {
    final CollectionReference _firestore =
        FirebaseFirestore.instance.collection('users');
    var documentReference = _firestore.doc();

    Map<String, dynamic> data = <String, dynamic>{
      'name': name.text,
      'email': email.text,
      'password': password.text,
    };
    try {
      auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      await documentReference
          .set(data)
          .whenComplete(() => print('$data'))
          .catchError((e) => print(e));
      isLogin.value = true;
    } on auth.FirebaseAuthException catch (e) {
      print(AuthExceptionHandler().handleException(e));
    }
  }

//Registration with google
  Future signWithgoogle() async {
    try {
      googleSignInAccount.value = await GoogleSignIn().signIn();
      if (googleSignInAccount.value == null) {
        isLogin.value = false;
      } else {
        isLogin.value = true;
      }
      // Get.toNamed('/homePage');
    } on auth.FirebaseAuthException catch (e) {
      print(e);
    }
  }

//Signin
  void signIn() async {
    try {
      auth.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      // Get.toNamed('/homePage');
    } on auth.FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }
}
