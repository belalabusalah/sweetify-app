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
                "You must be 18 or above to place an order, for customers aged 13-17 please    ask a parent or guardian for consent.",
              ),
            ),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              text: 'Login',
              onPressed: () {
                setState(() {
                  Get.toNamed("/signInScreen");
                });
              },
              color: Color(0xFF483028),
            ),
            SizedBox(height: 20.h),
            CustomElevatedButton(
              text: 'Create Account',
              onPressed: () {
                setState(() {
                  Get.toNamed("/signUpScreen");
                });
              },
              color: Color(0xFF483028),
            ),
            SizedBox(height: 22.5.h),
            AppText.caption(
              "Skip for Now",
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
                  "Autumn Chick",
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
