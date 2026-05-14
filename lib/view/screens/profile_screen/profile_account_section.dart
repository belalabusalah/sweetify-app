import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileAccountSection extends StatelessWidget {
  const ProfileAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logout Button
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.offAllNamed("/signInScreen");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text("Logout"),
          ),
        ),

        SizedBox(height: 10.h),

        // Delete Account
        Center(
          child: TextButton(
            onPressed: () {
              // TODO: Delete Account Logic
            },
            child: Text(
              "Delete Account",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ),

        SizedBox(height: 30.h),
      ],
    );
  }
}