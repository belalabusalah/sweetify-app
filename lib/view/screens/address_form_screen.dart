import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/screens_controller/address_controller.dart';
import 'package:sweetify_app/model/address_model.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_form_faild_app_custom.dart';

class AddressFormScreen extends StatefulWidget {
  const AddressFormScreen({super.key});

  @override
  State<AddressFormScreen> createState() => _AddressFormScreenState();
}

class _AddressFormScreenState extends State<AddressFormScreen> {
  final AddressController _controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  late final AddressData? _address;
  bool get _isEditMode => _address != null;
  late final TextEditingController _address_type;
  late final TextEditingController _recipientName;
  late final TextEditingController _mobile;
  late final TextEditingController _street;
  late final TextEditingController _buildingName;
  late final TextEditingController _buildingNumber;
  late final TextEditingController _block;
  late final TextEditingController _avenue;
  late final TextEditingController _area;
  late final TextEditingController _city;
  late final TextEditingController _countryCode;
  late final TextEditingController _postalCode;
  late final TextEditingController _landmark;
  late final TextEditingController _instructions;


  @override
  void initState() {
    super.initState();
    _address = Get.arguments as AddressData?;
    final a = _address;

    _address_type = TextEditingController(text: a?.title ?? '');
    _recipientName = TextEditingController(text: a?.recipientName ?? '');
    _mobile = TextEditingController(text: a?.mobile ?? '');
    _street = TextEditingController(text: a?.street ?? '');
    _buildingName = TextEditingController(text: a?.buildingName ?? '');
    _buildingNumber = TextEditingController(text: a?.buildingNumber ?? '');
    _block = TextEditingController(text: a?.block ?? '');
    _avenue = TextEditingController(text: a?.avenue ?? '');
    _area = TextEditingController(text: a?.area ?? '');
    _city = TextEditingController(text: a?.city ?? '');
    _countryCode = TextEditingController(
      text: (a?.countryCode.isNotEmpty ?? false) ? a!.countryCode : 'KW',
    );
    _postalCode = TextEditingController(text: a?.postalCode ?? '');
    _landmark = TextEditingController(text: a?.nearestLandmark ?? '');
    _instructions = TextEditingController(text: a?.specialInstructions ?? '');
  }

  @override
  void dispose() {
    _address_type.dispose();
    _recipientName.dispose();
    _mobile.dispose();
    _street.dispose();
    _buildingName.dispose();
    _buildingNumber.dispose();
    _block.dispose();
    _avenue.dispose();
    _area.dispose();
    _city.dispose();
    _countryCode.dispose();
    _postalCode.dispose();
    _landmark.dispose();
    _instructions.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final data = {
      'recipient_name': _recipientName.text.trim(),
      'mobile': _mobile.text.trim(),
      'street': _street.text.trim(),
      'building_name': _buildingName.text.trim(),
      'building_number': _buildingNumber.text.trim(),
      'block': _block.text.trim(),
      'avenue': _avenue.text.trim(),
      'area': _area.text.trim(),
      'city': _city.text.trim(),
      'country_code': _countryCode.text.trim(),
      'postal_code': _postalCode.text.trim(),
      'nearest_landmark': _landmark.text.trim(),
      'special_instructions': _instructions.text.trim(),
      'address_type': _address_type.text,
    };

    final error = _isEditMode
        ? await _controller.updateAddress(_address!.id, data)
        : await _controller.addAddress(data);

    if (error == null) {
      Get.back();
      Get.snackbar(
        '',
        _isEditMode ? "address.success_update".tr : "address.success_add".tr,
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

  Widget _field(
    String hint,
    TextEditingController controller, {
    bool required = false,
    TextInputType? keyboardType,
    int maxLines = 1,
  }) {
    return CustomTextFormField(
      hintText: hint,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: required
          ? (v) =>
                (v == null || v.trim().isEmpty) ? "address.required".tr : null
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText.title(
          _isEditMode ? "address.edit_title".tr : "address.add_new".tr,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          children: [
            _field("address.title_hint".tr, _address_type, required: true),
            SizedBox(height: 12.h),
            _field("address.recipient".tr, _recipientName, required: true),
            SizedBox(height: 12.h),
            _field(
              "address.mobile".tr,
              _mobile,
              required: true,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 12.h),
            _field("address.street".tr, _street, required: true),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(child: _field("address.block".tr, _block)),
                SizedBox(width: 12.w),
                Expanded(child: _field("address.avenue".tr, _avenue)),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _field("address.building_name".tr, _buildingName),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _field("address.building_number".tr, _buildingNumber),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _field("address.area".tr, _area, required: true),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _field("address.city".tr, _city, required: true),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _field("address.country_code".tr, _countryCode),
                ),
                SizedBox(width: 12.w),
                Expanded(child: _field("address.postal_code".tr, _postalCode)),
              ],
            ),
            SizedBox(height: 12.h),
            _field("address.landmark".tr, _landmark),
            SizedBox(height: 12.h),
            _field("address.instructions".tr, _instructions, maxLines: 3),
            SizedBox(height: 24.h),
            Obx(
              () => CustomElevatedButton(
                text: _controller.isSaving.value
                    ? "address.saving".tr
                    : "address.save".tr,
                onPressed: _controller.isSaving.value ? null : _submit,
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
