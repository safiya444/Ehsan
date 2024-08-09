import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomText extends StatelessWidget {
  final String text;
  final TextStyleType? styleType;
  final Color? textColor;
  final TextAlign? alignText;

  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overflow;
  final int? lineNum;

  const CustomText({
    super.key,
    required this.text,
    this.styleType,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.alignText,
    this.overflow,
    this.lineNum,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      maxLines: lineNum,
      text,
      style: getStyle(Get.size),
      textAlign: alignText,
    );
  }

  TextStyle getStyle(Size size) {
    TextStyle result = TextStyle();

    switch (styleType) {
      case TextStyleType.TITLE:
        result = TextStyle(
          fontSize: screenWidth(23),
          fontWeight: fontWeight ?? FontWeight.bold,
          color: textColor ?? AppColors.blackColor,
        );
        break;
      case TextStyleType.SUBTITLE:
        result = TextStyle(
          fontSize: screenWidth(26.2),
          fontWeight: fontWeight ?? FontWeight.w800,
          color: textColor ?? AppColors.whiteColor,
        );
        break;
      case TextStyleType.BODY:
        result = TextStyle(
          fontSize: screenWidth(29.6),
          fontWeight: fontWeight ?? FontWeight.w400,
          color: textColor ?? AppColors.blackColor,
        );
        break;
      case TextStyleType.SMALL:
        result = TextStyle(
          fontSize: screenWidth(33),
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? AppColors.blackColor,
        );
        break;
      case TextStyleType.NAME:
        result = TextStyle(
          fontSize: screenWidth(15),
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? AppColors.blackColor,
        );
        break;
      case TextStyleType.DATE:
        result = TextStyle(
          fontSize: screenWidth(26),
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? AppColors.blackColor,
        );
        break;

      case TextStyleType.CUSTOM:
        result = TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        );
        break;

      default:
        result = TextStyle(
          fontSize: screenWidth(31.2),
          fontWeight: fontWeight ?? FontWeight.normal,
          color: textColor ?? AppColors.blackColor,
        );
        break;
    }

    return result;
  }
}
