import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../custom_widgets/custom_elevated_button.dart';
import '../../../../custom_widgets/custom_text_button.dart';
import '../../../../custom_widgets/custom_text_field.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
      init: SigninController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false, // Prevent automatic resizing
          body: Stack(
            children: [
              // Background image fixed
              Positioned.fill(
                child: Image.asset(
                  "assets/login.png",
                  fit: BoxFit.cover,
                ),
              ),
              // Scrollable form content
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "User Name/Email",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      CustomTextFormField(
                                        prefixIcon: const Icon(
                                          Icons.email_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Enter your Email',
                                        controller:
                                        controller.usernameOrEmailController,
                                        textCapitalization: TextCapitalization.none,
                                        inputFormatter: [
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'\s'))
                                        ],
                                        validator: (val) =>
                                        GetUtils.isEmail(val!)
                                            ? null
                                            : 'Please enter valid email',
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        "Password",
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 1.h),
                                      Obx(() => CustomTextFormField(
                                        prefixIcon: const Icon(
                                          Icons.lock_clock_outlined,
                                          size: 20,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Enter your Password',
                                        controller: controller.passwordController,
                                        isObscure:
                                        controller.passwordVisible.isFalse,
                                        textCapitalization: TextCapitalization.none,
                                        maxLines: 1,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Password is required';
                                          }
                                          if (value.length < 6) {
                                            return 'Required valid password';
                                          }
                                          return null; // Password is valid
                                        },
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            controller.passwordVisible.value =
                                            !controller.passwordVisible.value;
                                          },
                                          icon: Icon(
                                            controller.passwordVisible.value
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            size: 24,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),),
                                      SizedBox(height: 2.h),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 24,
                                            child: CustomTextButton(
                                              onPressed: () {},
                                              text: 'Forgot Password?',
                                              foregroundColor: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: CustomElevatedButton(
                                    height: 6.h,
                                    width: 40.w,
                                    text: 'Log In',
                                    buttonTextStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    backgroundColor:Colors.red.shade400.withOpacity(0.8),
                                    onPressed: () {Get.offNamed(Routes.HOME);},
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Don’t have an account?',style: TextStyle(color: Colors.white,fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 28,
                                        child: CustomTextButton(
                                          onPressed: () {
                                            Get.offAllNamed(Routes.SIGNUP);
                                          },
                                          text: 'Register Now',
                                          textStyle: TextStyle(fontSize: 18,decoration: TextDecoration.underline),
                                          foregroundColor: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 2.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
