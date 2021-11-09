import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductUi extends StatelessWidget {
  const ProductUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(30),
      height: Adaptive.h(42),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.5),
              blurRadius: 6.0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Adaptive.w(100),
            height: Adaptive.h(23),
            margin:
                const EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 8),
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/22.jpg'),
                  fit: BoxFit.fill,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Electrec piano",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 5),
            child: Text(
              "100\$",
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
