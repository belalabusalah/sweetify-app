import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/screens_controller/address_controller.dart';
import 'package:sweetify_app/model/address_model.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: AppText.title("address.title".tr),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFFB741A)),
          );
        }

        if (controller.addresses.isEmpty) {
          return _buildEmptyState();
        }

        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: controller.addresses.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (_, index) => _AddressCard(
                  address: controller.addresses[index],
                  onTap: () => Get.toNamed(
                    '/addressFormScreen',
                    arguments: controller.addresses[index],
                  ),
                ),
              ),
            ),
            _buildAddButton(),
          ],
        );
      }),
    );
  }

  Widget _buildEmptyState() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_off_outlined,
                      size: 80.r, color: Colors.grey[400]),
                  SizedBox(height: 16.h),
                  AppText.subtitle(
                    "address.empty".tr,
                    color: Colors.grey[600],
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  AppText.body(
                    "address.empty_hint".tr,
                    color: Colors.grey[500],
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildAddButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: CustomElevatedButton(
        text: "address.add".tr,
        icon: Icons.add,
        onPressed: () => Get.toNamed('/addressFormScreen'),
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final AddressData address;
  final VoidCallback onTap;

  const _AddressCard({required this.address, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: Color(0xFFFB741A), size: 22),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.body(
                    address.title.isNotEmpty
                        ? address.title
                        : address.addressType,
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (address.street.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    AppText.caption(
                      address.street,
                      color: Colors.grey[600],
                      maxLines: 1,
                    ),
                  ],
                  if (address.mobile.isNotEmpty) ...[
                    SizedBox(height: 2.h),
                    AppText.caption(address.mobile, color: Colors.grey[500]),
                  ],
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
