import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/auth/auth_controller.dart';
import 'package:yanni_store/firebase_data/firebase_store.dart';
import 'custem_container.dart';

class Profile extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final FirebaseController firebaseController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: Adaptive.w(100),
            height: Adaptive.h(40),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.4),
                    blurRadius: 2.0,
                  ),
                ],
                color: Colors.blue[400],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Adaptive.h(6),
                ),
                const CircleAvatar(
                  // child: Icon(Icons.edit),
                  backgroundImage: AssetImage('assets/images/person.jpg'),
                  radius: 62,
                ),
                SizedBox(
                  height: Adaptive.h(2),
                ),
                Text(
                  '${authController.googleSignInAccount.value?.displayName ?? ''}',
                  style: GoogleFonts.lato(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Text('${authController.googleSignInAccount.value?.email ?? ''}',
                    style: GoogleFonts.lato(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        fontSize: 14))
              ],
            ),
          ),
          SizedBox(
            height: Adaptive.h(3),
          ),
          CustemContainer(
            tilte: "Shopping Address",
            icon: Icons.location_on_outlined,
          ),
          CustemContainer(
            tilte: "Payments",
            icon: Icons.payment,
          ),
          CustemContainer(
            tilte: "My Orders",
            icon: Icons.shopping_cart_outlined,
          ),
          CustemContainer(
            tilte: "Settings",
            icon: Icons.settings,
          ),
          CustemContainer(
            tilte: "favourites",
            icon: Icons.favorite_border,
          ),
          Spacer(),
          const Divider(
            height: 0,
            thickness: 1.5,
            color: Colors.redAccent,
          ),
          GestureDetector(
            onTap: () => authController.signout(),
            child: Container(
              height: Adaptive.h(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.login_outlined,
                    color: Colors.red[300],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Logout",
                    style: GoogleFonts.lato(
                        fontSize: 17,
                        color: Colors.red[300],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
          // TextButton(
          //   onPressed: () => Get.toNamed("/forget"),
          //   child: Text(
          //     "Logout",
          //     style: GoogleFonts.lato(
          //         color: Colors.redAccent, fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
    //     CustomScrollView(
    //   slivers: [
    //     SliverAppBar(
    //       flexibleSpace: FlexibleSpaceBar(
    //         centerTitle: true,
    //         background: Image.asset(
    //           'assets/images/person.jpg',
    //           fit: BoxFit.fill,
    //           width: Adaptive.w(100),
    //           height: Adaptive.h(40),
    //         ),
    //         title: const Text(
    //           'Sarah muhammed',
    //           textAlign: TextAlign.right,
    //           style: TextStyle(fontSize: 16),
    //         ),
    //       ),
    //       expandedHeight: Adaptive.h(40),
    //       // leading: Text(
    //       //   'Sarah muhammed',
    //       //   textAlign: TextAlign.start,
    //       // ),
    //       backgroundColor: Colors.transparent,
    //       // backwardsCompatibility: false,
    //       // toolbarHeight: Adaptive.h(40),
    //     ),
    //     SliverList(
    //         delegate: SliverChildBuilderDelegate(
    //       (context, index) {
    //         return CustemContainer(
    //           tilte: "Shopping Address",
    //           subTitle: "Shopping Address",
    //         );
    //       },
    //       childCount: 5,
    //     ))
    //   ],
    // ));
    //    Column(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           width: Adaptive.w(100),
    //           height: Adaptive.h(40),
    //           decoration: const BoxDecoration(
    //               image: DecorationImage(
    //                   image: AssetImage(
    //                     'assets/images/person.jpg',
    //                   ),
    //                   fit: BoxFit.fill),
    //               borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(10),
    //                   topRight: Radius.circular(10),
    //                   bottomLeft: Radius.circular(30),
    //                   bottomRight: Radius.circular(30))),
    //         ),
    //         ListView(
    //           shrinkWrap: true,
    //           children: [
    //               CustemContainer(
    //                 tilte: "Shopping Address",
    //                 subTitle: "Shopping Address",
    //               ),
    //               SizedBox(
    //                 height: Adaptive.h(2),
    //               ),
    //               CustemContainer(
    //                 tilte: "Shopping Address",
    //                 subTitle: "Shopping Address",
    //               ),
    //               SizedBox(
    //                 height: Adaptive.h(2),
    //               ),
    //               CustemContainer(
    //                 tilte: "Shopping Address",
    //                 subTitle: "Shopping Address",
    //               ),
    //               SizedBox(
    //                 height: Adaptive.h(2),
    //               ),
    //               CustemContainer(
    //                 tilte: "Shopping Address",
    //                 subTitle: "Shopping Address",
    //               ),
    //             ],
    //         )
    // child: Column(
    //   children: [
    //     SizedBox(
    //       height: Adaptive.h(10),
    //     ),
    //     // Padding(
    //     //   padding: const EdgeInsets.only(right: 150),
    //     //   child: Text(
    //     //     'My Profile',
    //     //     style: TextStyle(fontSize: 40, color: Colors.grey[700]),
    //     //   ),
    //     // ),
    //     // SizedBox(
    //     //   height: Adaptive.h(2),
    //     // ),
    //     // Row(
    //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     //   children: [
    //     //     const CircleAvatar(
    //     //       backgroundImage: AssetImage('assets/images/person.jpg'),
    //     //       radius: 60,
    //     //       backgroundColor: Colors.blue,
    //     //     ),
    //     //     Column(
    //     //       children: [
    //     //         Text(
    //     //           'Sarah muhammed',
    //     //           style: TextStyle(
    //     //               fontSize: 20, color: Colors.grey[900]),
    //     //         ),
    //     //         Text(
    //     //           'jo2014saleh@gmail.com',
    //     //           style: TextStyle(
    //     //               fontSize: 15, color: Colors.grey[800]),
    //     //         ),
    //     //       ],
    //     //     ),
    //     //   ],
    //     // ),
    //     const SizedBox(
    //       height: 20,
    //     ),
    //   ],
    // ),

    // Padding(
    //   padding: const EdgeInsets.only(left: 15, right: 15),
    //   child: ListView(
    //     shrinkWrap: true,
    //     children: [
    //       CustemContainer(
    //         tilte: "Shopping Address",
    //         subTitle: "Shopping Address",
    //       ),
    //       SizedBox(
    //         height: Adaptive.h(2),
    //       ),
    //       CustemContainer(
    //         tilte: "Shopping Address",
    //         subTitle: "Shopping Address",
    //       ),
    //       SizedBox(
    //         height: Adaptive.h(2),
    //       ),
    //       CustemContainer(
    //         tilte: "Shopping Address",
    //         subTitle: "Shopping Address",
    //       ),
    //       SizedBox(
    //         height: Adaptive.h(2),
    //       ),
    //       CustemContainer(
    //         tilte: "Shopping Address",
    //         subTitle: "Shopping Address",
    //       ),
    //     ],
    //   ),
    // )
    //       ]),
    // );
  
