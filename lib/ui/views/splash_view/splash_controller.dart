import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/intro/intro_view.dart';
import 'package:empty_code/ui/views/landing/landing_view.dart.dart';
import 'package:empty_code/ui/views/login/login.dart';
import 'package:empty_code/ui/views/main/main_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2)).then((value) {
   
      storage.getLoggedIn()
       ? Get.off(MainView())
       : Get.off(IntroView());
    });

    super.onInit();
  }
}
