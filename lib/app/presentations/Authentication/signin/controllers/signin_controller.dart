import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {

  TextEditingController usernameOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController verificationPinController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool passwordVisible = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
