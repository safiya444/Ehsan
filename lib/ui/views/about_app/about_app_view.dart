import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main/main_view.dart';
import 'package:empty_code/ui/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutAppView extends StatefulWidget {
  final bool ismain;
  final bool issetting;
  const AboutAppView(
      {super.key, required this.ismain, required this.issetting});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: screenWidth(6),
        title: CustomText(
          text: 'معلومات عن التطبيق',
          styleType: TextStyleType.NAME,
          textColor: AppColors.GreenApp,
        ),
        centerTitle: true,
        backgroundColor: AppColors.GreenLightApp,
        leading: IconButton(
            onPressed: () {
              widget.issetting
                  ? Get.to(SettingsView())
                  : widget.ismain
                      ? Get.to(MainView())
                      : null;
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: screenWidth(15),
              color: AppColors.GreenApp,
            )),
      ),
      body: Column(children: [
        SizedBox(
          height: screenWidth(25),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: screenWidth(30)),
          child: CustomText(
            text:
                'تطبيق إحسان : يوفر التطبيق العديد من الخصائص لتلبية احتياجات المستخدمين من عملية عرض المساعدات او طلب مساعدة من المجتمع...',
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(17),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              end: screenWidth(1.9), top: screenWidth(15)),
          child: CustomText(
            text: 'تواصل معنا عبر:',
            styleType: TextStyleType.CUSTOM,
            fontSize: screenWidth(17),
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: screenWidth(2.6), top: screenWidth(30)),
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
      ]),
    ));
  }
}
