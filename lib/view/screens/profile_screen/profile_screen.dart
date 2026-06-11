import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:AURA/controller/screens_controller/profile_controller.dart';
import 'package:AURA/view/screens/profile_screen/profile_account_section.dart';
import 'package:AURA/view/screens/profile_screen/profile_address_section.dart';
import 'package:AURA/view/screens/profile_screen/profile_header_section.dart';
import 'package:AURA/view/screens/profile_screen/profile_info_tile_section.dart';
import 'package:AURA/view/screens/profile_screen/profile_more_section.dart';
import 'package:AURA/view/screens/profile_screen/profile_settings_section.dart';
import 'package:AURA/view/widgets/card_tile_profile_custom.dart';
import 'package:AURA/view/widgets/text_app_custom.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController _profileController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text("profile.title".tr), centerTitle: true),
      body: Obx(() {
        if (_profileController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = _profileController.profile.value;

        if (user == null) {
          return Center(child: Text("profile.no_data".tr));
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              // ================= HEADER =================
              SizedBox(height: 20.h),
              ProfileHeader(),
              SizedBox(height: 20.h),

              // ================= INFO =================
              UserInfoSection(),

              // ================= ADDRESS =================
              AddressSection(),

              // ================= SETTINGS =================
              ProfileSettingsSection(),

              // ================= more section =================
              ProfileMoreSection(),

              // ================= ACCOUNT =================
              ProfileAccountSection(),
            ],
          ),
        );
      }),
    );
  }
}
