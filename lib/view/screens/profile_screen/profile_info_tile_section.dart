import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/controller/screens_controller/profile_controller.dart';
import 'package:sweetify_app/view/widgets/card_tile_profile_custom.dart';

class UserInfoSection extends StatelessWidget {
   UserInfoSection({super.key});
  final ProfileController _profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx((){
      final user = _profileController.profile.value;
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "profile.user_info".tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(height: 10.h),

        ProfileTile(
          icon: Icons.phone,
          title: "profile.phone".tr,
          subtitle: user!.phone,
        ),

        ProfileTile(
          icon: Icons.person,
          title: "profile.username".tr,
          subtitle: user.username,
        ),

        ProfileTile(
          icon: Icons.wc,
          title: "profile.gender".tr,
          subtitle: user.gender,
        ),

        SizedBox(height: 20.h),
      ],
    );});
  }
}