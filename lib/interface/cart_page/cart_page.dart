import 'package:flutter/material.dart';
import 'custem_cart_item.dart';
import 'empty_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  final _isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return _isEmpty
        ? EmptyCart()
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
