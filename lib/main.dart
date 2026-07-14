import 'package:AURA/%20services/settings_services.dart';
import 'package:AURA/localization/local.dart';
import 'package:AURA/localization/local_controller.dart';
import 'package:AURA/core/utils/mu_bindings.dart';
import 'package:AURA/view/app_routes/app_routes.dart';
import 'package:AURA/view/app_routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initalServices();
  runApp(MyApp());
}

Future initalServices() async {
  await Get.putAsync(() => SettingsServices().initSharedPreferences());
  Get.put(MyLocalController(), permanent: true);
}

class MyApp extends StatelessWidget {
  final localController = Get.find<MyLocalController>();
  MyApp({super.key});
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
          locale: localController.locale.value,
          translations: MyLocal(),
          initialRoute: RoutePaths.splashScreen,
          initialBinding: MuBindings(),
          getPages: AppRoutes.pages,
        );
      },
    );
  }
}
