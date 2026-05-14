import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            "User Info",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(height: 10.h),

        const ProfileTile(
          icon: Icons.phone,
          title: "Phone",
          subtitle: "0592026892",
        ),

        const ProfileTile(
          icon: Icons.person,
          title: "Username",
          subtitle: "belal_5678_agh",
        ),

        const ProfileTile(
          icon: Icons.wc,
          title: "Gender",
          subtitle: "Not set",
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}