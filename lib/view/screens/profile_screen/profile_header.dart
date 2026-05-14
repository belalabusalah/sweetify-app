import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45.r,
            backgroundImage: NetworkImage(
              "https://tullana.toldpath.com/storage/profile",
            ),
          ),
          SizedBox(height: 10.h),
          AppText.title(
            "belal abu sonia",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          AppText.body("belalabusonia@gmail.com"),
        ],
      ),
    );
  }
}
