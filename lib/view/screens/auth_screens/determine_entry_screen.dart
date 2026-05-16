import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

class DetermineEntryScreen extends StatefulWidget {
  const DetermineEntryScreen({super.key});

  @override
  State<DetermineEntryScreen> createState() => _DetermineEntryScreenState();
}

class _DetermineEntryScreenState extends State<DetermineEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(29.0.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.center,
              width: 300.w,
              child: AppText.body(
                fontSize: 12,
                "auth.age_notice".tr,
              ),
            ),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              text: "auth.login".tr,
              onPressed: () {
                setState(() {
                  Get.toNamed("/signInScreen");
                });
              },
              color: Color(0xFF483028),
            ),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              text: "auth.create_account".tr,
              onPressed: () {
                setState(() {
                  Get.toNamed("/signUpScreen");
                });
              },
              color: Color(0xFF483028),
            ),
            SizedBox(height: 22.5.h),
            AppText.caption(
              "auth.skip".tr,
              fontSize: 12,
              color: Color(0xFFA99577),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 9,
              children: [
                Image(
                  height: 40,
                  width: 38,
                  image: AssetImage("images/auth_images/sel_auth.png"),
                ),
                AppText(
                  "auth.brand_name".tr,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
