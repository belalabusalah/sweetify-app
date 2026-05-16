import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/view/widgets/card_tile_profile_custom.dart';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
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
          subtitle: "0592026892",
        ),

        ProfileTile(
          icon: Icons.person,
          title: "profile.username".tr,
          subtitle: "belal_5678_agh",
        ),

        ProfileTile(
          icon: Icons.wc,
          title: "profile.gender".tr,
          subtitle: "profile.not_set".tr,
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}