import 'package:get/get.dart';
import 'package:sweetify_app/%20services/profile_services.dart';
import 'package:sweetify_app/%20services/settings_services.dart';
import 'package:sweetify_app/model/profile_model.dart';

class ProfileController extends GetxController {
  final SettingsServices settings = Get.find();
  final ProfileService _service = ProfileService();

  RxBool isLoading = false.obs;
  Rx<ProfileModel?> profile = Rx<ProfileModel?>(null);

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    if (profile.value != null) return;

    isLoading.value = true;

    final token = settings.getToken();

    final response = await _service.getProfile(token: token ?? '');

    if (response != null && response['status'] == true) {
      profile.value = ProfileModel.fromJson(response['user']);
    }

    isLoading.value = false;
  }
}
