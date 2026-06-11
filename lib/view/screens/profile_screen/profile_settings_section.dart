import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:AURA/localization/local_controller.dart';
import 'package:AURA/view/widgets/card_tile_profile_custom.dart';

class ProfileSettingsSection extends StatelessWidget {
   ProfileSettingsSection({super.key});

  final MyLocalController _localController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            "profile.settings".tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),

        SizedBox(height: 10.h),

        // Theme
        ProfileTile(
          icon: Icons.dark_mode,
          title: "profile.theme".tr,
          subtitle: "profile.change_theme".tr,
        ),

        // Language
        ProfileTile(
          icon: Icons.language,
          title: "profile.language".tr,
          subtitle: "profile.lang_options".tr,
          onTap: (){
            _localController.toggleLang();
          },
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}
