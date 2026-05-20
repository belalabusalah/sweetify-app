import 'package:get/get.dart';
import 'package:sweetify_app/%20services/address_services.dart';
import 'package:sweetify_app/model/address_model.dart';

class AddressController extends GetxController {
  final GetAddressListService _service = Get.find<GetAddressListService>();

  final RxBool isLoading = false.obs;
  final RxBool isSaving = false.obs;
  final RxList<AddressData> addresses = <AddressData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAddresses();
  }

  Future<void> getAddresses() async {
    try {
      isLoading.value = true;
      final result = await _service.getAddressList();
      if (result != null && result.status == true) {
        addresses.value = result.data;
      } else {
        addresses.clear();
      }
    } catch (e) {
      print('[AddressController] getAddresses Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshAddresses() async {
    await getAddresses();
  }

  // Returns null on success, error message string on failure.
  Future<String?> addAddress(Map<String, dynamic> data) async {
    isSaving.value = true;
    try {
      final error = await _service.addAddress(data);
      if (error == null) await refreshAddresses();
      return error;
    } catch (e) {
      print('[AddressController] addAddress Error: $e');
      return e.toString();
    } finally {
      isSaving.value = false;
    }
  }

  // Returns null on success, error message string on failure.
  Future<String?> updateAddress(int id, Map<String, dynamic> data) async {
    isSaving.value = true;
    try {
      final error = await _service.updateAddress(id, data);
      if (error == null) await refreshAddresses();
      return error;
    } catch (e) {
      print('[AddressController] updateAddress Error: $e');
      return e.toString();
    } finally {
      isSaving.value = false;
    }
  }
}
