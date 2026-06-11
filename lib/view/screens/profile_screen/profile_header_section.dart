import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:AURA/controller/screens_controller/profile_controller.dart';
import 'package:AURA/view/widgets/text_app_custom.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});

  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final user = _profileController.profile.value;
      return Container(
        padding: EdgeInsets.all(20.r),
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 45.r,
              backgroundImage: NetworkImage(user!.image),
            ),
            SizedBox(height: 10.h),
            AppText.title(
              user.name,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            AppText.body(user.email),
          ],
        ),
      );
    });
  }
}
