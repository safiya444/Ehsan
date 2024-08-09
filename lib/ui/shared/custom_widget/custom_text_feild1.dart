import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class Custom_Text_Feild1 extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color hintTextColor;
  final TextInputType textInputType;
  final bool? obscuretext;
  final VoidCallback? onPressedSuffixIcon;
  final double? hintTextWidth;
  final TextEditingController? controller;
    final String? Function(String?)? validator;
    final Function(String)? onChanged;

  const Custom_Text_Feild1(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintTextColor,
      required this.textInputType,
      this.obscuretext,
      this.onPressedSuffixIcon,
      this.hintTextWidth, this.controller, this.validator, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      obscureText: obscuretext ?? false,
      obscuringCharacter: '*',
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: hintTextColor,
            fontSize: screenWidth(17) ?? screenWidth(hintTextWidth!)),
        prefixIcon: Padding(
          padding: EdgeInsetsDirectional.only(
              top: screenWidth(100),
              end: screenWidth(40),
              start: screenWidth(50)),
          child: Icon(
            prefixIcon,
            color: AppColors.GreenApp,
            size: screenWidth(11),
          ),
        ),
        suffixIcon: IconButton(
            onPressed: onPressedSuffixIcon,
            icon: Icon(
              suffixIcon,
              size: screenWidth(11),
              color: AppColors.GreenApp,
            )),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.GreenApp,
              width: screenWidth(120),
            ),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.GreenApp,
              width: screenWidth(120),
            ),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
