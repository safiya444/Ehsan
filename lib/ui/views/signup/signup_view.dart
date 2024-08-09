import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_button.dart.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_feild1.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main/main_view.dart';
import 'package:empty_code/ui/views/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpController controller = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenWidth(10),
              ),
              CustomText(
                text: 'التسجيل',
                styleType: TextStyleType.CUSTOM,
                textColor: AppColors.GreenApp,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth(11),
              ),
              SizedBox(
                height: screenWidth(10),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                    start: screenWidth(20), end: screenWidth(20)),
                width: screenWidth(1.1),
                height: screenWidth(6),
                child: Custom_Text_Feild1(
                    controller: controller.usernameController,
                    hintText: 'اسم المستخدم',
                    prefixIcon: Icons.person,
                    hintTextColor: AppColors.blackColor,
                    textInputType: TextInputType.name),
              ),
              SizedBox(
                height: screenWidth(12),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                    start: screenWidth(20), end: screenWidth(20)),
                width: screenWidth(1.1),
                height: screenWidth(6),
                child: Custom_Text_Feild1(
                    controller: controller.emailController,
                    hintText: 'البريد الالكتروني',
                    prefixIcon: Icons.email_outlined,
                    hintTextColor: AppColors.blackColor,
                    textInputType: TextInputType.emailAddress),
              ),
              SizedBox(
                height: screenWidth(12),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(
                    start: screenWidth(20), end: screenWidth(20)),
                width: screenWidth(1.1),
                height: screenWidth(6),
                child: Custom_Text_Feild1(
                    controller: controller.phoneController,
                    hintText: 'الهاتف',
                    prefixIcon: Icons.phone,
                    hintTextColor: AppColors.blackColor,
                    textInputType: TextInputType.phone),
              ),
              SizedBox(
                height: screenWidth(12),
              ),
              Container(
                  margin: EdgeInsetsDirectional.only(
                      start: screenWidth(20), end: screenWidth(20)),
                  width: screenWidth(1.1),
                  height: screenWidth(6),
                  child: Obx(() {
                    return Custom_Text_Feild1(
                      controller: controller.passwordController,
                      obscuretext: controller.obscuretext1.value,
                      hintText: 'كلمة السر',
                      prefixIcon: Icons.lock_outline,
                      hintTextColor: AppColors.blackColor,
                      textInputType: TextInputType.visiblePassword,
                      suffixIcon: controller.obscuretext1.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      onPressedSuffixIcon: () {
                        controller.obscuretext1.value =
                            !controller.obscuretext1.value;
                      },
                    );
                  })),
              SizedBox(
                height: screenWidth(12),
              ),
              Container(
                  margin: EdgeInsetsDirectional.only(
                      start: screenWidth(20), end: screenWidth(20)),
                  width: screenWidth(1.1),
                  height: screenWidth(6),
                  child: Obx(() {
                    return Custom_Text_Feild1(
                      controller: controller.confirmPasswordController,
                      obscuretext: controller.obscuretext2.value,
                      hintText: 'تأكيد كلمة السر',
                      prefixIcon: Icons.lock_outline,
                      hintTextColor: AppColors.blackColor,
                      textInputType: TextInputType.visiblePassword,
                      onPressedSuffixIcon: () {
                        controller.obscuretext2.value =
                            !controller.obscuretext2.value;
                      },
                      suffixIcon: controller.obscuretext2.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    );
                  })),
              SizedBox(
                height: screenWidth(12),
              ),
              Obx(() {
                return controller.isLoading.value
                    ? SpinKitCircle(
                        color: AppColors.GreenLightApp,
                      )
                    : CustomButton(
                        text: 'سجل الآن',
                        onPressed: () {
                          controller.SignUpApi();
                          storage.setLoggedIn(true);
                        });
              })
            ],
          ),
        ),
      ),
    ));
  }
}
