import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sweetify_app/view/widgets/card_tile_profile_custom.dart';

class ProfileSettingsSection extends StatelessWidget {
  const ProfileSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "Settings",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(height: 10.h),

        // Theme
        const ProfileTile(
          icon: Icons.dark_mode,
          title: "Theme",
          subtitle: "Change app theme",
        ),

        // Language
        const ProfileTile(
          icon: Icons.language,
          title: "Language",
          subtitle: "English / Arabic",
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}
