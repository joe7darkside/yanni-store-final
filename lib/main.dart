import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/accuonts/forgot_password_page.dart';
import 'package:yanni_store/categories/Tambourine.dart';
import 'package:yanni_store/categories/acoustic_guitar.dart';
import 'package:yanni_store/categories/classic_guitar.dart';
import 'package:yanni_store/categories/electric_guitar.dart';
import 'package:yanni_store/categories/trumpet.dart';
import 'package:yanni_store/store/search_bar_controller.dart';
import 'accuonts/registration.dart';
import 'categories/banjo.dart';
import 'categories/cello.dart';
import 'categories/clarinet.dart';
import 'categories/drums.dart';
import 'categories/harmonica.dart';
import 'categories/milodica.dart';
import 'categories/organ.dart';
import 'categories/oud.dart';
import 'categories/saxophone.dart';
import 'categories/violin.dart';
import 'interface/product_page/product_page.dart';
import 'interface/splash_screen/splash_screen.dart';
import 'profile/signIn/signin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final SearchbarController controller = Get.put(SearchbarController());
  controller.getItemsName();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          home: ProductPage(),
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: "/one", page: () => AcousticGuitarPage()),
            GetPage(name: "/two", page: () => ClassicGuitarPage()),
            GetPage(name: "/three", page: () => ElectricGuitarPage()),
            GetPage(name: "/four", page: () => DrumsPage()),
            GetPage(name: "/fife", page: () => BanjoPage()),
            GetPage(name: "/six", page: () => CelloPage()),
            GetPage(name: "/seven", page: () => ClarinetPage()),
            GetPage(name: "/eight", page: () => ViolinPage()),
            GetPage(name: "/nine", page: () => HarmonicaPage()),
            GetPage(name: "/ten", page: () => MilodicaPage()),
            GetPage(name: "/eleven", page: () => OudPage()),
            GetPage(name: "/twelve", page: () => SaxophonePage()),
            GetPage(name: "/treeteen", page: () => OrganPage()),
            GetPage(name: "/fourteen", page: () => TambourinePage()),
            GetPage(name: "/fifteen", page: () => TrumpetPage()),
            GetPage(name: "/sixteen", page: () => RegistrationPage()),
            GetPage(name: "/seventeen", page: () => SignIn()),
            GetPage(name: "/forget", page: () => ForgotPasswordPage())
          ]);
    });
  }
}
