import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweetify_app/view/screens/auth_screens/sign_in.dart';
import 'package:sweetify_app/view/screens/auth_screens/sign_up.dart';
import 'package:sweetify_app/view/screens/auth_screens/splash_screen.dart';
import 'package:sweetify_app/view/screens/determine_entry_screen.dart';


SharedPreferences? sharedprefe;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedprefe =  await SharedPreferences.getInstance();

  runApp(const MyApp());
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
          getPages: [
            GetPage(name: "/splashScreen", page: () => SplashScreen()),
            GetPage(name: "/determineEntryScreen", page: () => DetermineEntryScreen()),
            GetPage(name: "/signIn", page: () => SignIn()),
            GetPage(name: "/signUp", page: () => SignUp()),
          ],
        );
      },
    );
  }
}
