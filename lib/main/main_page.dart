import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanni_store/auth/auth_page.dart';

import 'package:yanni_store/categories/category_page.dart';
import 'package:yanni_store/home/home_page.dart';
import 'package:yanni_store/interface/products_items.dart';
import 'package:yanni_store/store/store_page.dart';
import 'botton_nav_bar.dart';
import 'nav_controller.dart';

class MainPage extends StatelessWidget {
  final BottonNav navController = Get.put(BottonNav());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottonNav>(
      builder: (controller) {
        return Scaffold(
            body: SafeArea(child: _body()),
            bottomNavigationBar: _bottonNavBar());
      },
    );
  }

  Widget _body() {
    List<Widget> pages = [
      const HomePage(),
      const ItemsPage(),
      const CategoryPage(),
      AuthPage(),
    ];
    return IndexedStack(
      index: navController.tabIndex,
      children: pages,
    );
  }

  Widget _bottonNavBar() {
    return FlashyTabBar(
        selectedIndex: navController.tabIndex,
        animationCurve: Curves.linear,
        backgroundColor: Colors.white,
        items: <FlashyTabBarItem>[
          FlashyTabBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.store),
            title: const Text('Store'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.people),
            title: const Text('Profile'),
          )
        ],
        onItemSelected: (index) {
          navController.onTab(index);
        });
  }
}
