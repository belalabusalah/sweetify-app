




import 'package:get/get.dart';
import 'package:sweetify_app/%20services/address_services.dart';
import 'package:sweetify_app/model/address_list_model.dart';

class AddressController extends GetxController {

  final GetAddressListService _service = Get.find<GetAddressListService>();

  // Loading state
  var isLoading = false.obs;

  // Address list
  var addresses = <AddressData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAddresses();
  }


  Future<void> getAddresses() async {
    try {
      isLoading.value = true;
      // isLoading(true);


      final result = await _service.getAddressList();

      if (result != null && result.status == true) {
        addresses.value = result.data;
      } else {
        addresses.clear();
      }

    } catch (e) {
      print("Controller Error: $e");
    } finally {
      isLoading.value = false;
      // isLoading(false);
    }
  }

  // Refresh manually (للسحب أو إعادة التحميل)
  Future<void> refreshAddresses() async {
    await getAddresses();
  }
}