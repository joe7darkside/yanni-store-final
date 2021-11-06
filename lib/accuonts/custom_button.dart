import 'package:flutter/material.dart';
import 'package:yanni_store/utils/images.dart';

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: () {},
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.indigo, Colors.blueAccent, Colors.blueAccent]),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                google_icon,
                width: 25,
              ),
              SizedBox(width: 40),
              Expanded(
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
