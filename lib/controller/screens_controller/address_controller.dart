import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/%20services/address_services.dart';
import 'package:sweetify_app/model/address_model.dart';

class AddressController extends GetxController {
  final GetAddressListService _service = Get.find<GetAddressListService>();

  // ── List state ─────────────────────────────────────────────────────────────
  final RxBool isLoading = false.obs;
  final RxBool isSaving = false.obs;
  final RxList<AddressData> addresses = <AddressData>[].obs;

  // ── Form state ─────────────────────────────────────────────────────────────
  final formKey = GlobalKey<FormState>();
  AddressData? currentAddress;
  bool isEditMode = false;

  final addressTypeController = TextEditingController();
  final recipientNameController = TextEditingController();
  final mobileController = TextEditingController();
  final streetController = TextEditingController();
  final buildingNameController = TextEditingController();
  final buildingNumberController = TextEditingController();
  final blockController = TextEditingController();
  final avenueController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final countryCodeController = TextEditingController();
  final postalCodeController = TextEditingController();
  final landmarkController = TextEditingController();
  final instructionsController = TextEditingController();

  // ── Lifecycle ──────────────────────────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    getAddresses();
  }

  @override
  void onClose() {
    addressTypeController.dispose();
    recipientNameController.dispose();
    mobileController.dispose();
    streetController.dispose();
    buildingNameController.dispose();
    buildingNumberController.dispose();
    blockController.dispose();
    avenueController.dispose();
    areaController.dispose();
    cityController.dispose();
    countryCodeController.dispose();
    postalCodeController.dispose();
    landmarkController.dispose();
    instructionsController.dispose();
    super.onClose();
  }

  // ── Form initialisation ────────────────────────────────────────────────────
  void initForm(AddressData? address) {
    currentAddress = address;
    isEditMode = address != null;
    final a = address;
    addressTypeController.text = a?.title ?? '';
    recipientNameController.text = a?.recipientName ?? '';
    mobileController.text = a?.mobile ?? '';
    streetController.text = a?.street ?? '';
    buildingNameController.text = a?.buildingName ?? '';
    buildingNumberController.text = a?.buildingNumber ?? '';
    blockController.text = a?.block ?? '';
    avenueController.text = a?.avenue ?? '';
    areaController.text = a?.area ?? '';
    cityController.text = a?.city ?? '';
    countryCodeController.text =
        (a?.countryCode.isNotEmpty ?? false) ? a!.countryCode : 'KW';
    postalCodeController.text = a?.postalCode ?? '';
    landmarkController.text = a?.nearestLandmark ?? '';
    instructionsController.text = a?.specialInstructions ?? '';
  }

  // ── Navigation ─────────────────────────────────────────────────────────────
  void navigateToAddAddress() => Get.toNamed('/addressFormScreen');

  void navigateToEditAddress(AddressData address) =>
      Get.toNamed('/addressFormScreen', arguments: address);

  // ── Form submit ────────────────────────────────────────────────────────────
  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) return;

    final data = {
      'recipient_name': recipientNameController.text.trim(),
      'mobile': mobileController.text.trim(),
      'street': streetController.text.trim(),
      'building_name': buildingNameController.text.trim(),
      'building_number': buildingNumberController.text.trim(),
      'block': blockController.text.trim(),
      'avenue': avenueController.text.trim(),
      'area': areaController.text.trim(),
      'city': cityController.text.trim(),
      'country_code': countryCodeController.text.trim(),
      'postal_code': postalCodeController.text.trim(),
      'nearest_landmark': landmarkController.text.trim(),
      'special_instructions': instructionsController.text.trim(),
      'address_type': addressTypeController.text,
    };

    final error = isEditMode
        ? await updateAddress(currentAddress!.id, data)
        : await addAddress(data);

    if (error == null) {
      Get.back();
      Get.snackbar(
        '',
        isEditMode ? "address.success_update".tr : "address.success_add".tr,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        titleText: const SizedBox.shrink(),
        margin: EdgeInsets.all(16.r),
      );
    } else {
      Get.snackbar(
        '',
        error,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        titleText: const SizedBox.shrink(),
        margin: EdgeInsets.all(16.r),
        duration: const Duration(seconds: 4),
      );
    }
  }

  // ── List / API ─────────────────────────────────────────────────────────────
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

  Future<void> refreshAddresses() async => getAddresses();

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
