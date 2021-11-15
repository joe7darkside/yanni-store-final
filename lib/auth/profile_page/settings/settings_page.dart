import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/auth/profile_page/settings/toggle_button.dart';
import 'package:yanni_store/auth/profile_page/settings/toggle_controller.dart';

class Settings extends StatelessWidget {
  final ToggleController toggleController = Get.put(ToggleController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: Adaptive.w(100),
                height: Adaptive.h(45),
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
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
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
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: ListTile(
                              subtitle: Text(
                                'jo2014saleh@gmail.com',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(16)),
                              ),
                              title: Text(
                                'Yennefer dou',
                                style:
                                    GoogleFonts.lato(fontSize: Adaptive.sp(18)),
                              ),
                              leading: const Card(
                                elevation: 10,
                                shape: CircleBorder(),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/images/person.jpg'),
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
