
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart';
import 'package:sweetify_app/controller/auth_controler/sign_in_controller.dart';

class MuBindings implements Bindings{
  @override
  void dependencies() {
    Get.put(SignInController(),permanent: true);
    // Get.lazyPut(()=>SignInController(),fenix: true);
  }
}