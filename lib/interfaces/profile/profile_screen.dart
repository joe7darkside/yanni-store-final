import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/controllers/animation_controller.dart';
import 'package:yanni_store/controllers/auth_controller.dart';
import 'package:yanni_store/controllers/toggle_controller.dart';
import 'package:yanni_store/widgets/circular_button/circular_button.dart';
import 'package:yanni_store/widgets/toggle_button/toggle_button.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key, this.name, this.image, this.email})
      : super(key: key);
  final AuthController authController = Get.put(AuthController());
  
  final ToggleController toggleController = Get.put(ToggleController());
  final String? name;
  final String? image;
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: Adaptive.h(40),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.fill),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Adaptive.h(25),
                  ),
                  Flexible(
                    child: Container(
                      width: Adaptive.w(90),
                      // height: Adaptive.h(100),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.4),
                              blurRadius: 2.0,
                            ),
                          ],
                          color: Colors.grey[100],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0))),
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              subtitle: Text(
                                '$email',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(17)),
                              ),
                              title: Text(
                                '$name',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(19)),
                              ),
                              leading: const Card(
                                elevation: 7,
                                shape: CircleBorder(),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/person.jpg'),
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () => authController.signOut(),
                                icon: Icon(
                                  Icons.login_outlined,
                                  size: 30,
                                  color: Colors.red[300],
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.grey[300],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 10, bottom: 10),
                            child: Text(
                              'Account Settings',
                              style: GoogleFonts.lato(
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.grey[600]),
                            ),
                          ),
                          InkWell(
                            enableFeedback: true,
                            child: ListTile(
                              title: Text(
                                'Edit Profile',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                              ),
                              trailing: Icon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                          InkWell(
                            enableFeedback: true,
                            child: ListTile(
                              title: Text(
                                'Change Password',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                              ),
                              trailing: Icon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                          InkWell(
                            enableFeedback: true,
                            child: ListTile(
                              title: Text(
                                'Add a Payment Mathod',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                              ),
                              trailing: Icon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Push Notifications',
                              style:
                                  GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                            ),
                            trailing: ToggleButton(
                              isToggled: toggleController.toggleValue1.value,
                              toggleButton: toggleController.toggleButton1,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Dark Mode',
                              style:
                                  GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                            ),
                            trailing: ToggleButton(
                              toggleButton: toggleController.toggleButton2,
                              isToggled: toggleController.toggleValue2.value,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.grey[300],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 10, bottom: 10),
                            child: Text(
                              'Account Settings',
                              style: GoogleFonts.lato(
                                  fontSize: Adaptive.sp(18),
                                  color: Colors.grey[600]),
                            ),
                          ),
                          InkWell(
                            enableFeedback: true,
                            child: ListTile(
                              title: Text(
                                'About us',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                              ),
                              trailing: Icon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                          InkWell(
                            enableFeedback: true,
                            child: ListTile(
                              title: Text(
                                'Privacy Policy',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                              ),
                              trailing: Icon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.grey[300],
                          ),
                          InkWell(
                            onTap: () => Get.toNamed('/dashboard'),
                            enableFeedback: true,
                            child: ListTile(
                              title: Text(
                                'Add Items',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                              ),
                              trailing: Icon(FontAwesomeIcons.chevronRight),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:yanni_store/controller/auth_controller.dart';
// import '../../widgets/custem_profile_container/custem_container.dart';

// class ProfileScreen extends StatelessWidget {
//   ProfileScreen({Key? key, this.name, this.image, this.email})
//       : super(key: key);
//   final AuthController authController = Get.put(AuthController());
//   // final FirebaseController firebaseController = Get.put(FirebaseController());
//   final String? name;
//   final String? image;
//   final String? email;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             width: Adaptive.w(100),
//             height: Adaptive.h(35),
//             decoration: BoxDecoration(
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Colors.grey,
//                     offset: Offset(0.0, 0.4),
//                     blurRadius: 2.0,
//                   ),
//                 ],
//                 color: Colors.blue[400],
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(0),
//                     topRight: Radius.circular(0),
//                     bottomLeft: Radius.circular(80),
//                     bottomRight: Radius.circular(80))),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: Adaptive.h(6),
//                 ),
//                 Stack(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.grey,
//                       backgroundImage: image != null
//                           ? NetworkImage("$image")
//                           : NetworkImage(
//                               'https://firebasestorage.googleapis.com/v0/b/yanni-store-2fe63.appspot.com/o/image%2Fprofile.png?alt=media&token=a95fcd5b-d6f1-4d43-82b6-ed55854bf10a'),
//                       radius: 62,
//                     ),
//                     Positioned(
//                         bottom: 1,
//                         right: 1,
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle, color: Colors.white),
//                           child: IconButton(
//                             icon: Icon(Icons.edit),
//                             onPressed: () => null,
//                           ),
//                         ))
//                   ],
//                 ),
//                 SizedBox(
//                   height: Adaptive.h(2),
//                 ),
//                 Text(
//                   '$name',
//                   style: GoogleFonts.lato(
//                       color: Colors.grey[800],
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24),
//                 ),
//                 Text('$email',
//                     style: GoogleFonts.lato(
//                         color: Colors.grey[800],
//                         fontWeight: FontWeight.w500,
//                         fontSize: 14))
//               ],
//             ),
//           ),
//           SizedBox(
//             height: Adaptive.h(3),
//           ),
//           CustemProfileContainer(
//             path: '',
//             tilte: "Shopping Address",
//             icon: Icons.location_on_outlined,
//           ),
//           CustemProfileContainer(
//             path: '',
//             tilte: "Payments",
//             icon: Icons.payment,
//           ),
//           CustemProfileContainer(
//             path: '',
//             tilte: "My Orders",
//             icon: Icons.shopping_cart_outlined,
//           ),
//           CustemProfileContainer(
//             path: "/settings",
//             tilte: "Settings",
//             icon: Icons.settings,
//           ),
//           CustemProfileContainer(
//             path: '',
//             tilte: "favourites",
//             icon: Icons.favorite_border,
//           ),
//           Spacer(),
//           const Divider(
//             height: 0,
//             thickness: 1.5,
//             color: Colors.redAccent,
//           ),
//           GestureDetector(
//             onTap: () => authController.signOut(),
//             child: Container(
//               height: Adaptive.h(7),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.login_outlined,
//                     color: Colors.red[300],
//                   ),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   Text(
//                     "Logout",
//                     style: GoogleFonts.lato(
//                         fontSize: 17,
//                         color: Colors.red[300],
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//           )
//           // TextButton(
//           //   onPressed: () => Get.toNamed("/forget"),
//           //   child: Text(
//           //     "Logout",
//           //     style: GoogleFonts.lato(
//           //         color: Colors.redAccent, fontWeight: FontWeight.bold),
//           //   ),
//           // ),
//         ],
//       ),
//     ));
//   }
// }
//     //     CustomScrollView(
//     //   slivers: [
//     //     SliverAppBar(
//     //       flexibleSpace: FlexibleSpaceBar(
//     //         centerTitle: true,
//     //         background: Image.asset(
//     //           'assets/images/person.jpg',
//     //           fit: BoxFit.fill,
//     //           width: Adaptive.w(100),
//     //           height: Adaptive.h(40),
//     //         ),
//     //         title: const Text(
//     //           'Sarah muhammed',
//     //           textAlign: TextAlign.right,
//     //           style: TextStyle(fontSize: 16),
//     //         ),
//     //       ),
//     //       expandedHeight: Adaptive.h(40),
//     //       // leading: Text(
//     //       //   'Sarah muhammed',
//     //       //   textAlign: TextAlign.start,
//     //       // ),
//     //       backgroundColor: Colors.transparent,
//     //       // backwardsCompatibility: false,
//     //       // toolbarHeight: Adaptive.h(40),
//     //     ),
//     //     SliverList(
//     //         delegate: SliverChildBuilderDelegate(
//     //       (context, index) {
//     //         return CustemProfileContainer(
//     //           tilte: "Shopping Address",
//     //           subTitle: "Shopping Address",
//     //         );
//     //       },
//     //       childCount: 5,
//     //     ))
//     //   ],
//     // ));
//     //    Column(
//     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     // crossAxisAlignment: CrossAxisAlignment.center,
//     //       children: [
//     //         Container(
//     //           width: Adaptive.w(100),
//     //           height: Adaptive.h(40),
//     //           decoration: const BoxDecoration(
//     //               image: DecorationImage(
//     //                   image: AssetImage(
//     //                     'assets/images/person.jpg',
//     //                   ),
//     //                   fit: BoxFit.fill),
//     //               borderRadius: BorderRadius.only(
//     //                   topLeft: Radius.circular(10),
//     //                   topRight: Radius.circular(10),
//     //                   bottomLeft: Radius.circular(30),
//     //                   bottomRight: Radius.circular(30))),
//     //         ),
//     //         ListView(
//     //           shrinkWrap: true,
//     //           children: [
//     //               CustemProfileContainer(
//     //                 tilte: "Shopping Address",
//     //                 subTitle: "Shopping Address",
//     //               ),
//     //               SizedBox(
//     //                 height: Adaptive.h(2),
//     //               ),
//     //               CustemProfileContainer(
//     //                 tilte: "Shopping Address",
//     //                 subTitle: "Shopping Address",
//     //               ),
//     //               SizedBox(
//     //                 height: Adaptive.h(2),
//     //               ),
//     //               CustemProfileContainer(
//     //                 tilte: "Shopping Address",
//     //                 subTitle: "Shopping Address",
//     //               ),
//     //               SizedBox(
//     //                 height: Adaptive.h(2),
//     //               ),
//     //               CustemProfileContainer(
//     //                 tilte: "Shopping Address",
//     //                 subTitle: "Shopping Address",
//     //               ),
//     //             ],
//     //         )
//     // child: Column(
//     //   children: [
//     //     SizedBox(
//     //       height: Adaptive.h(10),
//     //     ),
//     //     // Padding(
//     //     //   padding: const EdgeInsets.only(right: 150),
//     //     //   child: Text(
//     //     //     'My Profile',
//     //     //     style: TextStyle(fontSize: 40, color: Colors.grey[700]),
//     //     //   ),
//     //     // ),
//     //     // SizedBox(
//     //     //   height: Adaptive.h(2),
//     //     // ),
//     //     // Row(
//     //     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //     //   children: [
//     //     //     const CircleAvatar(
//     //     //       backgroundImage: AssetImage('assets/images/person.jpg'),
//     //     //       radius: 60,
//     //     //       backgroundColor: Colors.blue,
//     //     //     ),
//     //     //     Column(
//     //     //       children: [
//     //     //         Text(
//     //     //           'Sarah muhammed',
//     //     //           style: TextStyle(
//     //     //               fontSize: 20, color: Colors.grey[900]),
//     //     //         ),
//     //     //         Text(
//     //     //           'jo2014saleh@gmail.com',
//     //     //           style: TextStyle(
//     //     //               fontSize: 15, color: Colors.grey[800]),
//     //     //         ),
//     //     //       ],
//     //     //     ),
//     //     //   ],
//     //     // ),
//     //     const SizedBox(
//     //       height: 20,
//     //     ),
//     //   ],
//     // ),

//     // Padding(
//     //   padding: const EdgeInsets.only(left: 15, right: 15),
//     //   child: ListView(
//     //     shrinkWrap: true,
//     //     children: [
//     //       CustemProfileContainer(
//     //         tilte: "Shopping Address",
//     //         subTitle: "Shopping Address",
//     //       ),
//     //       SizedBox(
//     //         height: Adaptive.h(2),
//     //       ),
//     //       CustemProfileContainer(
//     //         tilte: "Shopping Address",
//     //         subTitle: "Shopping Address",
//     //       ),
//     //       SizedBox(
//     //         height: Adaptive.h(2),
//     //       ),
//     //       CustemProfileContainer(
//     //         tilte: "Shopping Address",
//     //         subTitle: "Shopping Address",
//     //       ),
//     //       SizedBox(
//     //         height: Adaptive.h(2),
//     //       ),
//     //       CustemProfileContainer(
//     //         tilte: "Shopping Address",
//     //         subTitle: "Shopping Address",
//     //       ),
//     //     ],
//     //   ),
//     // )
//     //       ]),
//     // );
  
