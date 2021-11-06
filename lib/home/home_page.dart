import 'package:flutter/material.dart';
import 'package:yanni_store/cards/custom_card.dart';
import 'package:yanni_store/utils/images.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 2),
            child: Image.asset(
              home_page_image,
              fit: BoxFit.fitWidth,
              height: 200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "New",
                    style: TextStyle(fontSize: 22),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
          Container(
            // margin: EdgeInsets.only(left: 12, right: 12),
            height: 272,
            // width: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomCard(
                  image: cards_image1,
                  title: 'item1',
                  price: "10",
                  category: 'uuuuu',
                ),
                CustomCard(
                  image: cards_image2,
                  title: 'item2',
                  price: "10",
                  category: 'gggg',
                ),
                CustomCard(
                  image: cards_image3,
                  title: 'item3',
                  price: "10",
                  category: 'ppppp',
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Offers",
                    style: TextStyle(fontSize: 22),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(color: Colors.white),
                      )))
            ],
          ),
          Container(
            // margin: EdgeInsets.only(left: 12, right: 12),
            height: 272,
            // width: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomCard(
                  image: cards_image1,
                  title: 'item1',
                  price: "10",
                  category: 'uuuuu',
                ),
                CustomCard(
                  image: cards_image2,
                  title: 'item2',
                  price: "10",
                  category: 'gggg',
                ),
                CustomCard(
                  image: cards_image3,
                  title: 'item3',
                  price: "10",
                  category: 'ppppp',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
