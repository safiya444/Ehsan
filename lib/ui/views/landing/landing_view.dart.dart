import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_button.dart.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login/login.dart';
import 'package:empty_code/ui/views/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Landing_View extends StatefulWidget {
  const Landing_View({super.key});

  @override
  State<Landing_View> createState() => _Landing_ViewState();
}

class _Landing_ViewState extends State<Landing_View> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: screenWidth(6), left: screenWidth(60)),
            child: Card(
              shadowColor: AppColors.graylightColor,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              elevation: 15,
              child: Image.asset(
                'assets/images/pngs/newcolor.jpg',
                width: screenWidth(1.2),
                height: screenWidth(1.2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: screenWidth(5),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                end: screenWidth(20), start: screenWidth(20)),
            child: CustomButton(
              text: "تسجيل الدخول",
              onPressed: () {
                Get.to(Login());
              },
            ),
          ),
          SizedBox(
            height: screenWidth(10),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: screenWidth(20), end: screenWidth(20)),
            child: CustomButton(
              text: "التسجيل",
              onPressed: () {
                Get.to(SignUpView());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
