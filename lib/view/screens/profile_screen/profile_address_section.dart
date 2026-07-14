import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:AURA/controller/screens_controller/address_controller.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController controller = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "profile.address".tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(height: 10.h),

        Obx(() {
          if (controller.isLoading.value) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              height: 80.h,
              child: const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xFFFB741A),
                ),
              ),
            );
          }

          if (controller.addresses.isEmpty) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "profile.shipping_address".tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "address.empty".tr,
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ],
              ),
            );
          }

          final first = controller.addresses.first;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  first.title.isNotEmpty
                      ? first.title
                      : "profile.shipping_address".tr,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (first.street.isNotEmpty) ...[
                  SizedBox(height: 6.h),
                  Text(first.street),
                ],
                if (first.mobile.isNotEmpty) ...[
                  SizedBox(height: 6.h),
                  Text("📱 ${first.mobile}"),
                ],
              ],
            ),
          );
        }),

        SizedBox(height: 10.h),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextButton(
            onPressed: () => Get.toNamed("/addressScreen"),
            child: Text("profile.manage_addresses".tr),
          ),
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}
