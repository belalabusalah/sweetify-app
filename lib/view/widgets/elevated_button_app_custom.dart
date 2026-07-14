import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:AURA/view/widgets/text_app_custom.dart';

// import 'app_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  final Color? color;
  final Color? textColor;

  final double? width;
  final double? height;
  final double radius;
  final double fontSizeText;

  final IconData? icon;
  final double iconSize;

  static const Color defaultColor = Color(0xFFFB741A);

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width,
    this.height,
    this.radius =100,
    this.icon,
     this.fontSizeText=16,
     this.iconSize=24,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null;

    return SizedBox(
      width: width ?? double.infinity.w,
      height: height ?? 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
          isDisabled ? Colors.grey : (color ?? defaultColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius.r),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: icon == null
            ? AppText.body(
          text,
          fontSize: 16.sp,
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            AppText.body(
              text,
              fontSize: fontSizeText.sp,
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 8.w),
            Icon(
              icon,
              color: textColor ?? Colors.white,
              size: iconSize.sp,
            ),
          ],
        ),
      ),
    );
  }
}