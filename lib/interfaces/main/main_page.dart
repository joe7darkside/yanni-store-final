import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanni_store/controllers/nav_controller.dart';
import 'package:yanni_store/interfaces/auth/signin_screen.dart';
import 'package:yanni_store/interfaces/cart/cart_screen.dart';
import 'package:yanni_store/interfaces/home/home_screen.dart';
import 'package:yanni_store/interfaces/store/store_page.dart';
import '../../widgets/botton_nav_bar/botton_nav_bar.dart';

class MainScreen extends StatelessWidget {
  final BottonNavBar navController = Get.put(BottonNavBar());

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottonNavBar>(
      builder: (controller) {
        return Scaffold(
            body: SafeArea(child: _body()),
            bottomNavigationBar: _bottonNavBarBar());
      },
    );
  }

  Widget _body() {
    List<Widget> pages = [
      HomeScreen(),
      StoreScreen(),
      CartScreen(),
      SigninScreen(),
    ];
    return IndexedStack(
      index: navController.tabIndex,
      children: pages,
    );
  }

  Widget _bottonNavBarBar() {
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
