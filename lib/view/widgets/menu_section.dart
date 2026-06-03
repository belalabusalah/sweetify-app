import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/screens_controller/profile_controller.dart';
import '../screens/profile_screen/profile_address_section.dart';
import '../screens/profile_screen/profile_header_section.dart';
import '../screens/profile_screen/profile_more_section.dart';
import '../screens/profile_screen/profile_settings_section.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(),
          child: Obx(() {
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
                  SizedBox(height: 8.h),

                  // ================= ADDRESS =================
                  AddressSection(),
      
                  // ================= SETTINGS =================
                  ProfileSettingsSection(),
      
                  // ================= more section =================
                  ProfileMoreSection(),

                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
