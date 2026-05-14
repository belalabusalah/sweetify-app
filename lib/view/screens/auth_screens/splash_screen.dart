import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sweetify_app/view/widgets/elevated_button_app_custom.dart';
import 'package:sweetify_app/view/widgets/text_app_custom.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: .infinity.w,
        height: .infinity.h,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage("images/auth_images/splash_screen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(21.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText.title(
                "Snuggle Into Comfort",
                maxLines: 2,
                color: Colors.white,
                textAlign: TextAlign.center,
                fontSize: 40.sp,
              ),
              AppText.body("Discover Cozy Elegance. Shop Now!",color: Colors.white,),
              SizedBox(height: 12.h,),
              CustomElevatedButton(
                text: 'Get Comfy',
                width: 200,
                radius: 100,
                icon: Icons.arrow_forward,
                onPressed: () {
                  Get.toNamed("/determineEntryScreen");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
