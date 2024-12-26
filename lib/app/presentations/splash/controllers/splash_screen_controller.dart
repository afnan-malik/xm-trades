import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xm_trades/app/presentations/Authentication/signup/views/signup_view.dart';

class SplashScreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    splashTimer();
  }

  void splashTimer() {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => const SignupView());
    });
  }
}



