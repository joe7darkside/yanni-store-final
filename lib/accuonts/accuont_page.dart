import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanni_store/accuonts/signin_controller.dart';

class AccuontPage extends StatelessWidget {
  final SignInController googleController = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Size.infinite.height,
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundImage:
                NetworkImage("${googleController.userPhoto.value}"),
            radius: 50.0,
          ),
          SizedBox(
            height: 10,
          ),
          Text("${googleController.userName}"),
          SizedBox(
            height: 10,
          ),
          Text("${googleController.userEmail}"),
          ActionChip(
              label: Text("Logout"),
              onPressed: () {
                googleController.googlelogOut();
              })
        ],
      ),
    );
  }
}
