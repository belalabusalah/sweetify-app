import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            "More",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(height: 10.h),

        // About Us
        const ProfileTile(
          icon: Icons.info,
          title: "About Us",
        ),

        // Privacy Policy
        const ProfileTile(
          icon: Icons.privacy_tip,
          title: "Privacy Policy",
        ),

        // Terms & Conditions
        const ProfileTile(
          icon: Icons.description,
          title: "Terms & Conditions",
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}