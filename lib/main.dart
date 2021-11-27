import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:yanni_store/interfaces/dashboard/post_products_ui.dart';
import 'auth/Registration_page.dart';
import 'controllers/get_products.dart';
import 'interfaces/auth/forgot_password_page.dart';
import 'interfaces/auth/signin_screen.dart';
import 'interfaces/product/product_page.dart';
import 'interfaces/profile/profile_screen.dart';
import 'interfaces/splash/splash_screen.dart';
import 'utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GetProductsController controller = Get.put(GetProductsController());

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
          themeMode: ThemeMode.system,
          // themeMode: hemes.light,
          darkTheme: Themes.dark,
          theme: Themes.light,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
          getPages: [
            GetPage(name: "/auth", page: () => SigninScreen()),
            GetPage(name: "/ProfileSettings", page: () => ProfileScreen()),
            GetPage(name: "/register", page: () => RegisterPage()),
            GetPage(name: "/forgot", page: () => ForgotPasswordScreen()),
            GetPage(name: '/productUi', page: () => ProductScreen()),
            GetPage(name: '/AddProduct', page: () => PostProduct()),
          ]);
    });
  }
}
