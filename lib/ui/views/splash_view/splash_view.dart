import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/splash_view/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: Image.asset(
              'assets/images/pngs/new-splash.png',
              width: screenWidth(1),
            ),
          ),
        ],
      ),
    ));
  }
}
