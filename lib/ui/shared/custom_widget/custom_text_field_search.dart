import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class SerchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const SerchTextField({super.key, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged:onChanged ,
      decoration: InputDecoration(
          fillColor: AppColors.whiteColor,
          filled: true,
          hintText: 'ابحث عن...',
          hintStyle:
              TextStyle(color: AppColors.blackColor, fontSize: screenWidth(20)),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.blackColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 167, 171, 174),
              width: screenWidth(200),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 167, 171, 174),
              width: screenWidth(200),
            ),
          )),
    );
  }
}
