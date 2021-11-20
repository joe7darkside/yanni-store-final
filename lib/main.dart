import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/accuonts/forgot_password_page.dart';
import 'package:yanni_store/auth/signin_page.dart';
import 'package:yanni_store/dashboard/add_product/ui/post_products_ui.dart';
import 'package:yanni_store/dashboard/dashboard.dart';
import 'auth/Registration_page.dart';
import 'auth/auth_page.dart';
import 'auth/profile_page/settings/settings_page.dart';
import 'dashboard/logic/fetch_products.dart';
import 'interface/store/products/product_page.dart';
import 'interface/splash_screen/splash_screen.dart';
import 'utils/theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FetchProductsController controller = Get.put(FetchProductsController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
          // themeMode: hemes.light,
          darkTheme: Themes.dark,
          theme: Themes.light,
          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: "/auth", page: () => SignInPage()),
            GetPage(name: "/ProfileSettings", page: () => ProfileSettings()),
            GetPage(name: "/register", page: () => RegisterPage()),
            GetPage(name: "/forgot", page: () => ForgotPasswordPage()),
            GetPage(name: '/productUi', page: () => ProductPage()),
            GetPage(name: '/AddProduct', page: () => AddProduct()),

          ]);
    });
  }
}
