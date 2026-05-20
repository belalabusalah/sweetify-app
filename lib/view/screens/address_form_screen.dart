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

  @override
  void initState() {
    super.initState();
    _controller.initForm(Get.arguments as AddressData?);
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
          _controller.isEditMode
              ? "address.edit_title".tr
              : "address.add_new".tr,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _controller.formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          children: [
            _field(
              "address.title_hint".tr,
              _controller.addressTypeController,
              required: true,
            ),
            SizedBox(height: 12.h),
            _field(
              "address.recipient".tr,
              _controller.recipientNameController,
              required: true,
            ),
            SizedBox(height: 12.h),
            _field(
              "address.mobile".tr,
              _controller.mobileController,
              required: true,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 12.h),
            _field(
              "address.street".tr,
              _controller.streetController,
              required: true,
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _field("address.block".tr, _controller.blockController),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child:
                      _field("address.avenue".tr, _controller.avenueController),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _field(
                    "address.building_name".tr,
                    _controller.buildingNameController,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _field(
                    "address.building_number".tr,
                    _controller.buildingNumberController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _field(
                    "address.area".tr,
                    _controller.areaController,
                    required: true,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _field(
                    "address.city".tr,
                    _controller.cityController,
                    required: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _field(
                    "address.country_code".tr,
                    _controller.countryCodeController,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _field(
                    "address.postal_code".tr,
                    _controller.postalCodeController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            _field("address.landmark".tr, _controller.landmarkController),
            SizedBox(height: 12.h),
            _field(
              "address.instructions".tr,
              _controller.instructionsController,
              maxLines: 3,
            ),
            SizedBox(height: 24.h),
            Obx(
              () => CustomElevatedButton(
                text: _controller.isSaving.value
                    ? "address.saving".tr
                    : "address.save".tr,
                onPressed:
                    _controller.isSaving.value ? null : _controller.submitForm,
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
