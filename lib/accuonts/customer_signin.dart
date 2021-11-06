import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yanni_store/accuonts/custom_button.dart';
import 'package:yanni_store/accuonts/signin_controller.dart';
import 'package:yanni_store/utils/images.dart';

class CustomerSigninPage extends StatelessWidget {
  // const CustomerSigninPage({Key? key}) : super(key: key);
  final SignInController controller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: Size.infinite.height,
      // width: Size.infinite.width,
      child: Column(
        children: [
          SvgPicture.asset(
            social_signin,
            width: 300,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70,right: 70),
            child: MyButton(),
          )
          // ActionChip(
          //   elevation: 4.0,
          //   padding: EdgeInsets.all(2.0),
          //   avatar: CircleAvatar(
          //       backgroundColor: Colors.transparent,
          //       child: Image.asset(
          //         facebook_icon,
          //         width: 25,
          //       )),
          //   label: Text("Sign in with Facebook"),
          //   onPressed: () {},
          //   backgroundColor: Colors.white,
          //   shape: StadiumBorder(
          //       side: BorderSide(
          //     width: 1,
          //     color: Colors.indigo,
          //   )),
          // ),
          // ActionChip(
          //   elevation: 4.0,
          //   padding: EdgeInsets.all(2.0),
          //   avatar: CircleAvatar(
          //       backgroundColor: Colors.transparent,
          //       child: Image.asset(
          //         google_icon,
          //         width: 25,
          //       )),
          //   label: Text("Sign in with Google"),
          //   onPressed: () {
          //     // _key.currentState.showSnackBar(SnackBar(
          //     //   content: Text('Message...'),
          //     // ));
          //   },
          //   backgroundColor: Colors.white,
          //   shape: StadiumBorder(
          //       side: BorderSide(
          //     width: 1,
          //     color: Colors.indigo,
          //   )),
          // ),
          // ActionChip(
          //   elevation: 4.0,
          //   padding: EdgeInsets.all(2.0),
          //   avatar: CircleAvatar(
          //       backgroundColor: Colors.transparent,
          //       child: Image.asset(
          //         twitter_icon,
          //         width: 25,
          //       )),
          //   label: Text("Sign in with Twitter"),
          //   onPressed: () {},
          //   backgroundColor: Colors.white,
          //   shape: StadiumBorder(
          //       side: BorderSide(
          //     width: 1,
          //     color: Colors.indigo,
          //   )),
          // ),
          // ActionChip(
          //   elevation: 4.0,
          //   padding: EdgeInsets.all(2.0),
          //   avatar: CircleAvatar(
          //       backgroundColor: Colors.transparent,
          //       child: Image.asset(
          //         admin_image,
          //         width: 25,
          //       )),
          //   label: Text("Sign in as Admin"),
          //   onPressed: () {},
          //   backgroundColor: Colors.white,
          //   shape: StadiumBorder(
          //       side: BorderSide(
          //     width: 1,
          //     color: Colors.indigo,
          //   )),
          // )
        ],
      ),
    );
  }
}
