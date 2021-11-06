// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInController extends GetxController {
//   var _googleSign = GoogleSignIn();
//   var googleAccunt = Rx<GoogleSignInAccount?>(null);
//   var userName = ''.obs;
//   var userEmail = ''.obs;
//   var userPhoto = ''.obs;
//   var userToken;

//   login() async {
//     try {
//       googleAccunt.value = await _googleSign.signIn();
//       userName.value = _googleSign.currentUser!.displayName!;
//       userEmail.value = _googleSign.currentUser!.email;
//       userPhoto.value = _googleSign.currentUser!.photoUrl!;
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }

//   logout() async {
//     try {
//       googleAccunt.value = await _googleSign.signOut();
//     } on PlatformException catch (e) {
//       print(e);
//     }
//   }
// }
