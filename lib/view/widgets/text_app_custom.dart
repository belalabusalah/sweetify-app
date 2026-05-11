import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle base(BuildContext context,
      {double? fontSize,
        FontWeight? fontWeight,
        Color? color}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
    );
  }

  static TextStyle title(BuildContext context,
      {double? fontSize, Color? color}) =>
      base(
        context,
        fontSize: fontSize ?? 22,
        fontWeight: FontWeight.bold,
        color: color,
      );

  static TextStyle subtitle(BuildContext context,
      {double? fontSize, Color? color}) =>
      base(
        context,
        fontSize: fontSize ?? 18,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle body(BuildContext context,
      {double? fontSize, Color? color}) =>
      base(
        context,
        fontSize: fontSize ?? 14,
        fontWeight: FontWeight.normal,
        color: color,
      );

  static TextStyle caption(BuildContext context,
      {double? fontSize, Color? color}) =>
      base(
        context,
        fontSize: fontSize ?? 12,
        fontWeight: FontWeight.w400,
        color: color,
      );
}

class AppText extends StatelessWidget {
  final String text;

  final TextStyle Function(BuildContext context)? styleBuilder;

  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
      this.text, {
        super.key,
        this.styleBuilder,
        this.fontSize,
        this.color,
        this.fontWeight,
        this.textAlign,
        this.maxLines,
        this.overflow,
      });

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle =
    (styleBuilder ?? AppTextStyles.body)(context);

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: baseStyle.copyWith(
        fontSize: fontSize?.sp,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  // 🔥 FACTORIES

  factory AppText.title(
      String text, {
        double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        TextAlign? textAlign,
        int? maxLines,
      }) {
    return AppText(
      text,
      styleBuilder: AppTextStyles.title,
      fontSize: fontSize?.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  factory AppText.subtitle(
      String text, {
        double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        TextAlign? textAlign,
        int? maxLines,
      }) {
    return AppText(
      text,
      styleBuilder: AppTextStyles.subtitle,
      fontSize: fontSize?.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  factory AppText.body(
      String text, {
        double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        TextAlign? textAlign,
        int? maxLines,
        TextOverflow? overflow,
      }) {
    return AppText(
      text,
      styleBuilder: AppTextStyles.body,
      fontSize: fontSize?.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  factory AppText.caption(
      String text, {
        double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        TextAlign? textAlign,
        int? maxLines,
      }) {
    return AppText(
      text,
      styleBuilder: AppTextStyles.caption,
      fontSize: fontSize?.sp,
      color: color,
      fontWeight: fontWeight,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}