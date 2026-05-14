import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/instance_manager.dart';
import 'package:sweetify_app/%20services/settings_services.dart';
import 'package:sweetify_app/utils/mu_bindings.dart';
import 'package:sweetify_app/view/screens/auth_screens/sign_in_screen.dart';
import 'package:sweetify_app/view/screens/auth_screens/sign_up_screen.dart';
import 'package:sweetify_app/view/screens/auth_screens/splash_screen.dart';
import 'package:sweetify_app/view/screens/auth_screens/determine_entry_screen.dart';
import 'package:sweetify_app/view/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(const MyApp());
}

Future initalServices() async {
  await Get.putAsync(() => SettingsServices().initSharedPreferences());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
          initialRoute: "/splashScreen",
          initialBinding: MuBindings(),
          getPages: [
            GetPage(name: "/splashScreen", page: () => SplashScreen()),
            GetPage(name: "/determineEntryScreen",page: () => DetermineEntryScreen(),),
            GetPage(name: "/signIn", page: () => SignInScreen()),
            GetPage(name: "/signUpScreen", page: () => SignUpScreen()),
            GetPage(name: "/homeScreen", page: () => HomeScreen()),
          ],
        );
      },
    );
  }
}
