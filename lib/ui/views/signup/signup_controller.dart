import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/repositry/auth_repository.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool obscuretext1 = true.obs;
  RxBool obscuretext2 = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  SignUpApi() async {
    print('email for login: ${emailController.text}');
    print('Password for login: ${passwordController.text}');
    print('confirmPassword for login: ${confirmPasswordController.text}');
    print('phone for login: ${phoneController.text}');
    print('username for login: ${usernameController.text}');
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      isLoading.value = true;
      await AuthRepository()
          .Register(
              email: emailController.text,
              password: passwordController.text,
              username: usernameController.text,
              phone: phoneController.text,
              confirmPassword: confirmPasswordController.text)
          .then((value) {
        isLoading.value = false;
        print(value);
        value.fold((l) {
          BotToast.showText(
            text: l,
            duration: Duration(seconds: 3),
            contentPadding: EdgeInsets.all(15),
            textStyle: TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
            contentColor: AppColors.GreenLightApp,
          );
        }, (r) {
          Get.offAll(MainView());
          storage.setTokenInfo(r);
        });
      });
    }
  }
}
