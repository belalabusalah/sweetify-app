import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sweetify_app/%20services/settings_services.dart';
import 'package:sweetify_app/controller/auth_controller/sign_in_controller.dart';
import 'package:sweetify_app/controller/auth_controller/sign_up_controller.dart';
import 'package:sweetify_app/controller/screens_controller/profile_controller.dart';
import 'package:sweetify_app/controller/screens_controller/support_controller.dart';

class MuBindings implements Bindings {
  @override
  void dependencies() {
    Get.putAsync<SettingsServices>(() async {
      return await SettingsServices().initSharedPreferences();
    });

    // Get.put(SignInController(),permanent: true);
    Get.lazyPut(() => SignInController(), fenix: true);

    // Get.put(SignUpController(),permanent: true);
    Get.lazyPut(() => SignUpController(), fenix: true);

    Get.lazyPut(() => ProfileController(), fenix: true);

    Get.put(SupportController());
  }
}
