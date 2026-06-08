import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sweetify_app/%20services/settings_services.dart';
import 'package:sweetify_app/controller/auth_controller/sign_in_controller.dart';
import 'package:sweetify_app/controller/auth_controller/sign_up_controller.dart';
import 'package:sweetify_app/controller/screens_controller/address_controller.dart';
import 'package:sweetify_app/controller/screens_controller/home_controller.dart';
import 'package:sweetify_app/controller/screens_controller/profile_controller.dart';
import 'package:sweetify_app/controller/screens_controller/support_controller.dart';
import 'package:sweetify_app/controller/screens_controller/wish_list_controller.dart';
import '../ services/address_services.dart';
import '../controller/screens_controller/main_navigation_controller.dart';

class MuBindings implements Bindings {
  @override
  void dependencies() {
    Get.putAsync<SettingsServices>(() async {
      return await SettingsServices().initSharedPreferences();
    });

    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);

    // Services — must be registered before their dependent controllers
    Get.put(GetAddressListService());

    // Controllers
    Get.put(SupportController());
    Get.put(AddressController());
    Get.put(MainNavigationController());
    Get.put(HomeController());
    Get.put(WishListController());
  }
}
