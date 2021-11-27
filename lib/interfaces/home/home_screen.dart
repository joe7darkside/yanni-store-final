import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  //  ProductModel controller=Get.put(ProductModel());
  final _lableStyle =
      GoogleFonts.firaSans(fontSize: 22, fontWeight: FontWeight.w600);
  final _buttonStyle = GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[700]);
  final _icon = Icon(
    Icons.double_arrow_rounded,
    color: Colors.grey[600],
    size: 25,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    "New Arrival",
                    style: _lableStyle,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 10, top: 15),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: _buttonStyle,
                          ),
                          _icon
                        ],
                      )))
            ],
          ),
          Container(
            height: 272,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "New Offers",
                    style: _lableStyle,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 10, top: 12),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: _buttonStyle,
                          ),
                          _icon
                        ],
                      )))
            ],
          ),
          Container(
            // margin: EdgeInsets.only(left: 12, right: 12),
            height: 272,
            // width: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Most Populer",
                    style: _lableStyle,
                  )),
              Container(
                  margin: EdgeInsets.only(left: 15, right: 10, top: 12),
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'See More',
                            style: _buttonStyle,
                          ),
                          _icon
                        ],
                      )))
            ],
          ),
          Container(
            height: 272,
            // width: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
