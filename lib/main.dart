import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/accuonts/forgot_password_page.dart';
// import 'package:yanni_store/accuonts/signin_page.dart';
// import 'package:yanni_store/categories/Tambourine.dart';
// import 'package:yanni_store/categories/acoustic_guitar.dart';
// import 'package:yanni_store/categories/classic_guitar.dart';
// import 'package:yanni_store/categories/electric_guitar.dart';
// import 'package:yanni_store/categories/trumpet.dart';
// import 'package:yanni_store/store/search_bar_controller.dart';
// import 'accuonts/registration.dart';
import 'auth/Registration_page.dart';
import 'auth/auth_page.dart';
// import 'categories/banjo.dart';
// import 'categories/cello.dart';
// import 'categories/clarinet.dart';
// import 'categories/drums.dart';
// import 'categories/harmonica.dart';
// import 'categories/milodica.dart';
// import 'categories/organ.dart';
// import 'categories/oud.dart';
// import 'categories/saxophone.dart';
// import 'categories/violin.dart';
// import 'interface/product_page/product_page.dart';
import 'auth/profile_page/settings/settings_page.dart';
import 'interface/store_ui/products/product_page.dart';
import 'interface/store_ui/store_page.dart';
import 'interface/splash_screen/splash_screen.dart';
import 'products/dashboard/add/add_products.dart';
import 'products/dashboard/add/dashboard.dart';
import 'products/dashboard/add/fetch_data_form_firebase.dart';
import 'interface/store_ui/products/product_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FetchDataFromFirebase controller = Get.put(FetchDataFromFirebase());
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.dark(),
          theme: ThemeData.light(),
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: "/auth", page: () => AuthPage()),
            GetPage(name: "/settings", page: () => Settings()),
            GetPage(name: "/register", page: () => RegisterPage()),
            GetPage(name: "/forgot", page: () => ForgotPasswordPage()),
            GetPage(name: '/productUi', page: () => ProductPage()),
            // GetPage(name: "/two", page: () => ClassicGuitarPage()),
            // GetPage(name: "/three", page: () => ElectricGuitarPage()),
            // GetPage(name: "/four", page: () => DrumsPage()),
            // GetPage(name: "/fife", page: () => BanjoPage()),
            // GetPage(name: "/six", page: () => CelloPage()),
            // GetPage(name: "/seven", page: () => ClarinetPage()),
            // GetPage(name: "/eight", page: () => ViolinPage()),
            // GetPage(name: "/nine", page: () => HarmonicaPage()),
            // GetPage(name: "/ten", page: () => MilodicaPage()),
            // GetPage(name: "/eleven", page: () => OudPage()),
            // GetPage(name: "/twelve", page: () => SaxophonePage()),
            // GetPage(name: "/treeteen", page: () => OrganPage()),
            // GetPage(name: "/fourteen", page: () => TambourinePage()),
            // GetPage(name: "/fifteen", page: () => TrumpetPage()),
          ]);
    });
  }
}
