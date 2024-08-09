import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_button.dart.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_feild1.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login/login_controller.dart';
import 'package:empty_code/ui/views/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginContrller controller = Get.put(LoginContrller());
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
                        height: screenWidth(4),
                      ),
                      CustomText(
                        text: 'تسجيل الدخول ',
                        styleType: TextStyleType.CUSTOM,
                        textColor: AppColors.GreenApp,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth(11),
                      ),
                      SizedBox(
                        height: screenWidth(5),
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
                            textInputType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty)
                                return "Please enter email";
                              else if (!isEmailValid(value))
                                return "Please enter Valid email";
                              else
                                return null;
                            },
                          )),
                      SizedBox(
                        height: screenWidth(8),
                      ),
                      Container(
                          margin: EdgeInsetsDirectional.only(
                              start: screenWidth(20), end: screenWidth(20)),
                          width: screenWidth(1.1),
                          height: screenWidth(6),
                          child: Obx(() {
                            return Custom_Text_Feild1(
                              controller: controller.passwordController,
                              obscuretext: controller.obscuretext.value,
                              hintText: 'كلمةالسر',
                              prefixIcon: Icons.lock_outline,
                              hintTextColor: AppColors.blackColor,
                              textInputType: TextInputType.visiblePassword,
                              onPressedSuffixIcon: () {
                                controller.obscuretext.value =
                                    !controller.obscuretext.value;
                              },
                              suffixIcon: controller.obscuretext.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              validator: (value) {
                                if (!isComplexPassword(value!))
                                  return "Please enter valid password";
                                else
                                  return null;
                              },
                            );
                          })),
                      SizedBox(
                        height: screenWidth(8),
                      ),
                      Obx(() {
                        return controller.isLoading.value
                            ? SpinKitCircle(
                                color: AppColors.GreenLightApp,
                              )
                            : CustomButton(
                                text: 'سجل الآن',
                                onPressed: () {
                                  controller.LoginApi();
                                  storage.setLoggedIn(true);
                          
                                });
                      }),
                      Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: screenWidth(14), top: screenWidth(10)),
                        child: Row(
                          children: [
                            CustomText(
                              text: 'ليس لديك حساب ؟',
                              styleType: TextStyleType.CUSTOM,
                              fontSize: screenWidth(22),
                              textColor: AppColors.blackColor,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.off(SignUpView());
                                },
                                child: CustomText(
                                  text: 'انشاء حساب',
                                  textColor: AppColors.GreenLightApp,
                                  styleType: TextStyleType.CUSTOM,
                                  fontSize: screenWidth(22),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
