import 'package:flutter/material.dart';
import '../../widgets/custem_cart_item/custem_cart_item.dart';
import 'empty_cart_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  final _isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return _isEmpty
        ? EmptyCartScreen()
        : Column(
            children: [
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CustemCartItem();
                  },
                  itemCount: 7,
                ),
              ),
            ],
          );
  }
}
