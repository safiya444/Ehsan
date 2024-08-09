import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText(
        text: text,
        styleType: TextStyleType.CUSTOM,
        textColor: AppColors.whiteColor,
        fontSize: screenWidth(13),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.GreenLightApp,
          fixedSize: Size(screenWidth(1.1), screenWidth(6)),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                  color: AppColors.GreenApp, width: screenWidth(90)))),
    );
  }
}
