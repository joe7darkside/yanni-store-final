import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yanni_store/categories/category_page.dart';
import 'package:yanni_store/home/home_page.dart';
import 'package:yanni_store/profile/signIn/signin_page.dart';
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
            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: Colors.blueGrey,
            //   child: Icon(Icons.search),
            //   onPressed: () {},
            // ),
            body: SafeArea(child: _body()
                // IndexedStack(
                //   index: controller.tabIndex,
                //   children: [
                //     HomePage(),
                //     StorePage(),
                //     CategoryPage(),
                //     CustomerSigninPage()
                //   ],
                // ),
                ),
            bottomNavigationBar: _bottonNavBar()
            //  BottomNavigationBar(
            //   onTap: controller.onTab,
            //   currentIndex: controller.tabIndex,
            //   items: [
            //     BottomNavigationBarItem(
            //       backgroundColor: Colors.blue[900],
            //       icon: Icon(
            //         Icons.home_outlined,
            //         color: Colors.white,
            //       ),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       backgroundColor: Colors.blue[900],
            //       icon: Icon(
            //         Icons.shopping_cart_outlined,
            //         color: Colors.white,
            //       ),
            //       label: 'Store',
            //     ),
            //     BottomNavigationBarItem(
            //       backgroundColor: Colors.blue[900],
            //       icon: Icon(
            //         Icons.category_outlined,
            //         color: Colors.white,
            //       ),
            //       label: 'categories',
            //     ),
            //     BottomNavigationBarItem(
            //       backgroundColor: Colors.blue[900],
            //       icon: Icon(
            //         Icons.person_outline,
            //         color: Colors.white,
            //       ),
            //       label: 'Account',
            //     ),
            //   ],
            // ),
            );
      },
    );
  }

  Widget _body() {
    List<Widget> pages = [HomePage(), StorePage(), CategoryPage(), SignIn()];
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
            icon: const Icon(Icons.apps),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.people),
            title: const Text('Profile'),
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
