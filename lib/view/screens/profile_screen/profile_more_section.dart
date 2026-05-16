import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/view/widgets/card_tile_profile_custom.dart';

class ProfileMoreSection extends StatelessWidget {
  const ProfileMoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "profile.more".tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(height: 10.h),

        // About Us
        ProfileTile(
          icon: Icons.info,
          title: "more.about_us".tr,
          onTap: (){
            Get.toNamed("/aboutUsScreen");
          },
        ),

        // Privacy Policy
        ProfileTile(
          icon: Icons.privacy_tip,
          title: "more.privacy_policy".tr,
          onTap: (){
            Get.toNamed("/privacyPolicyScreen");
          },
        ),

        // Terms & Conditions
        ProfileTile(
          icon: Icons.description,
          title: "more.terms".tr,
          onTap: (){
            Get.toNamed("/termsConditionsScreen");
          },
        ),

        ProfileTile(
          icon: Icons.support_agent,
          title: "support".tr,
          onTap: (){
            Get.toNamed("/supportScreen");
          },
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}