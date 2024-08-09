import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/about_app/about_app_view.dart';
import 'package:empty_code/ui/views/communication/communication_view.dart';
import 'package:empty_code/ui/views/main/side_item.dart';
import 'package:empty_code/ui/views/main/side_menu.dart';
import 'package:empty_code/ui/views/privacy_policy/privacy_policy_view.dart';
import 'package:empty_code/ui/views/terms_of_use/terms_of_use_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  GlobalKey<ScaffoldState> scafolldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: scafolldKey,
      drawer: SideMenu(),
      appBar: AppBar(
        toolbarHeight: screenWidth(6),
        title: CustomText(
          text: 'الاعدادات',
          styleType: TextStyleType.NAME,
          textColor: AppColors.GreenApp,
        ),
        centerTitle: true,
        backgroundColor: AppColors.GreenLightApp,
        leading: IconButton(
            onPressed: () {
              scafolldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.density_medium_outlined,
              size: screenWidth(15),
              color: AppColors.GreenApp,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenWidth(20),
          ),
          Side_item(
              icon: Icons.phone,
              title: 'اتصل بنا',
              onTap: () {
                Get.to(CommunicatioView());
              },
              iconcolor: AppColors.GreenLightApp),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Side_item(
              icon: Icons.error_outline,
              title: 'عن التطبيق',
              onTap: () {
                Get.to(AboutAppView(
                  ismain: false,
                  issetting: true,
                ));
              },
              iconcolor: AppColors.GreenLightApp),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Side_item(
              icon: Icons.fingerprint_outlined,
              title: 'سياسة الخصوصية',
              onTap: () {
                Get.to(PrivacyPolicyView());
              },
              iconcolor: AppColors.GreenLightApp),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Side_item(
              icon: Icons.settings_accessibility_outlined,
              title: 'شروط الاستخدام',
              onTap: () {
                Get.to(TermsOfUseView());
              },
              iconcolor: AppColors.GreenLightApp)
        ],
      ),
    ));
  }
}
