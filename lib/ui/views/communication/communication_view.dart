import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunicatioView extends StatefulWidget {
  const CommunicatioView({super.key});

  @override
  State<CommunicatioView> createState() => _CommunicatioViewState();
}

class _CommunicatioViewState extends State<CommunicatioView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth(6),
        title: CustomText(
          text: 'طرق التواصل',
          styleType: TextStyleType.NAME,
          textColor: AppColors.GreenApp,
        ),
        centerTitle: true,
        backgroundColor: AppColors.GreenLightApp,
        leading: IconButton(
            onPressed: () {
              Get.to(SettingsView());
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: screenWidth(15),
              color: AppColors.GreenApp,
            )),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.whiteColor, boxShadow: [
              BoxShadow(
                  color: AppColors.graylightColor,
                  offset: Offset(2, 2),
                  blurRadius: 10)
            ]),
            width: screenWidth(1),
            height: screenWidth(4),
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(2.5)),
              child: Row(
                children: [
                  CustomText(
                    text: ' ehsan@gmail.com',
                    styleType: TextStyleType.TITLE,
                    textColor: Color.fromARGB(255, 37, 139, 222),
                  ),
                  SizedBox(
                    width: screenWidth(45),
                  ),
                  CustomText(
                      text: ':email',
                      styleType: TextStyleType.TITLE,
                      textColor: AppColors.blackColor),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenWidth(150),
          ),
          Container(
            decoration: BoxDecoration(color: AppColors.whiteColor, boxShadow: [
              BoxShadow(
                  color: AppColors.graylightColor,
                  offset: Offset(2, 2),
                  blurRadius: 10)
            ]),
            width: screenWidth(1),
            height: screenWidth(4),
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: screenWidth(1.75)),
              child: Row(
                children: [
                  CustomText(
                    text: 'ehsan@',
                    styleType: TextStyleType.TITLE,
                    textColor: Color.fromARGB(255, 37, 139, 222),
                  ),
                  SizedBox(
                    width: screenWidth(45),
                  ),
                  CustomText(
                      text: ':telegram',
                      styleType: TextStyleType.TITLE,
                      textColor: AppColors.blackColor),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
