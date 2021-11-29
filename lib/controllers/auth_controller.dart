import 'dart:async';
import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  var userLogin = Rx<User?>(null);
  var googleSignInAccount = Rx<GoogleSignInAccount?>(null);
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  @override
  void onInit() {
    _initializeFirebase();

    super.onInit();
  }

  Future<User?> registerWithEmailAndPassword() async {
    User? user;

    FirebaseAuth? auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      user = userCredential.user;
      await user!.updateDisplayName(name.text);
      await user.reload();
      user = auth.currentUser;
      if (user != null && user.emailVerified) {
        userLogin.value = user;
      } else if (user != null && !user.emailVerified) {
        await user
            .sendEmailVerification()
            .whenComplete(() => userLogin.value = user);
      } else {
        //* Do nothing
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
    return user;
  }

  Future<User?> signInWithEmailAndPassword() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      user = userCredential.user;
      if (user != null && user.emailVerified) {
        userLogin.value = user;
      } else if (user != null && !user.emailVerified) {
        await user
            .sendEmailVerification()
            .whenComplete(() => userLogin.value = user);
        userLogin.value = user;
      } else {
        //* Do nothing
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
    return user;
  }

  Future signWithgoogle() async {
    try {
      googleSignInAccount.value = await GoogleSignIn().signIn();
    } on auth.FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Void? signOut() {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    userLogin.value = null;
  }

  static Future<User?> refreshUser(User user) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await user.reload();
    User? refreshedUser = auth.currentUser;

    return refreshedUser;
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userLogin.value = user;
    }
    return firebaseApp;
  }
}
