import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/about_app/about_app_view.dart';
import 'package:empty_code/ui/views/home/home_view.dart';
import 'package:empty_code/ui/views/landing/landing_view.dart.dart';
import 'package:empty_code/ui/views/main/main_view.dart';
import 'package:empty_code/ui/views/main/side_item.dart';
import 'package:empty_code/ui/views/post_request/post_request_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(1.3),
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Container(
            color: AppColors.GreenLightApp,
            width: screenWidth(1.3),
            height: screenWidth(5.5),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: screenWidth(20), top: screenWidth(40)),
              child: CustomText(
                text: 'إحسان',
                styleType: TextStyleType.CUSTOM,
                fontSize: screenWidth(11),
                textColor: AppColors.GreenApp,
              ),
            ),
          ),
          SizedBox(
            height: screenWidth(20),
          ),
          Side_item(
            icon: Icons.home,
            title: 'الرئيسية',
            onTap: () {
              Get.to(HomeView());
            },
            iconcolor: AppColors.GreenLightApp,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Side_item(
            icon: Icons.add,
            title: 'نشرالطلب',
            onTap: () {
              Get.to(PostRequestView());
            },
            iconcolor: AppColors.GreenLightApp,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Side_item(
            icon: Icons.error_outline,
            title: 'عن التطبيق',
            onTap: () {
              Get.to(AboutAppView(
                ismain: true,
                issetting: false,
              ));
            },
            iconcolor: AppColors.GreenLightApp,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Side_item(
            icon: Icons.logout_outlined,
            title: 'تسجيل الخروج',
            onTap: () {
              storage.setLoggedIn(false);
            

              Get.off(Landing_View());
              BotToast.showText(
                text: 'تم تسجيل الخروج',
                duration: Duration(seconds: 3),
                contentPadding: EdgeInsets.all(15),
                textStyle:
                    TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
                contentColor: AppColors.GreenLightApp,
              );
            },
            iconcolor: AppColors.GreenLightApp,
          ),
        ],
      ),
    );
  }
}
