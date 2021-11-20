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
  // RxBool isLogin = false.obs;
  @override
  void onInit() {
    _initializeFirebase();
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user != null) {
    //     print('user is logeding');
    //   } else {
    //     print('user is not logeding');
    //   }
    // });
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
      // await user?.sendEmailVerification();
      // if (user != null && user.emailVerified) {
      //   userLogin.value = user;
      // }
      // user?.emailVerified;
      // userLogin.value = user;
      // if (user != null && user.emailVerified) {
      //   isLogin.value = true;
      // }
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
      } else {
        //* Do nothing
      }
      // user?.emailVerified;
      // print(user);
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

//   var isLogin = false.obs;
//   StreamSubscription<User?>? user;
//   final User? _user = auth.FirebaseAuth.instance.currentUser;
//   @override//   final email = TextEditingController();
//   final name = TextEditingController();
//   final password = TextEditingController();
//   void onInit() {
//     user = FirebaseAuth.instance.authStateChanges().listen((user) {
//       if (user == null) {
//         isLogin.value = false;
//         print('User is currently signed out!');
//       } else {
//         isLogin.value = true;
//         userName = RxString(_user!.displayName!);
//         userEmail = RxString(_user!.email!);
//         print('User is signed in!');
//       }
//     });
//     email.text = "";
//     password.text = "";
//     super.onInit();
//   }

//   // @override
//   // void onClose() {
//   //   // user.cancel();
//   //   email.dispose();
//   //   password.dispose();
//   //   super.onClose();
//   // }

//   verifyEmail() async {
//     if (_user != null && !_user!.emailVerified) {
//       await _user!.sendEmailVerification();
//       Get.toNamed('/verifying');

//       print('Link sent to your email');
//     } else {
//       Get.toNamed('/homePage');
//     }
//   }

// //Signout
//   signout() async {
//     try {
//       await auth.FirebaseAuth.instance.signOut();
//       await GoogleSignIn().signOut();
//     } catch (e) {
//       print(e);
//     }
//   }

// //Registration with email and password
//   void create() async {
//     final CollectionReference _firestore =
//         FirebaseFirestore.instance.collection('users');
//     var documentReference = _firestore.doc();

//     Map<String, dynamic> data = <String, dynamic>{
//       'name': name.text,
//       'email': email.text,
//       'password': password.text,
//     };
//     try {
//       auth.FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email.text, password: password.text);
//       await documentReference
//           .set(data)
//           .whenComplete(() => print('$data'))
//           .catchError((e) => print(e));
//       isLogin.value = true;
//     } on auth.FirebaseAuthException catch (e) {
//       print(AuthExceptionHandler().handleException(e));
//     }
//   }

// //Registration with google

// //Signin
//   void signIn() async {
//     try {
//       auth.FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email.text, password: password.text);
//       // Get.toNamed('/homePage');
//     } on auth.FirebaseAuthException catch (e) {
//       print('Failed with error code: ${e.code}');
//       print(e.message);
//     }
//   }
}
