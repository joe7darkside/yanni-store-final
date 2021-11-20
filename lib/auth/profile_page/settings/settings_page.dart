import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/auth/profile_page/settings/toggle_button.dart';
import 'package:yanni_store/auth/profile_page/settings/toggle_controller.dart';

import '../../auth_controller.dart';

class ProfileSettings extends StatelessWidget {
  ProfileSettings({this.name, this.image, this.email});
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
                            trailing: ToggleBotton(
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
                            trailing: ToggleBotton(
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
