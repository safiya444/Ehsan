import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/login_and_regester_info.dart';
import 'package:empty_code/core/data/repositry/auth_repository.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginContrller extends GetxController {
  RxBool obscuretext = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  LoginApi() async {
    print('email for login: ${emailController.text}');
    print('Password for login: ${passwordController.text}');
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      // تنفيذ الشيفرة إذا كانت البيانات صحيحة

      isLoading.value = true;
      await AuthRepository()
          .login(email: emailController.text, password: passwordController.text)
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
