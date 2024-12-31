import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/custom_widgets/custom_elevated_button.dart';
import 'package:xm_trades/app/routes/app_pages.dart';

import '../../../../custom_widgets/custom_text_button.dart';
import '../../../../custom_widgets/custom_text_field.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.red.shade900,
            resizeToAvoidBottomInset: false, // Prevents automatic resizing
            body: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/register.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                            ),
                            child: IntrinsicHeight(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(
                                  "User Name",
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                CustomTextFormField(
                                    hintText: 'Enter Name',
                                    controller: controller.nameController,
                                    keyboardType: TextInputType.text,
                                    prefixIcon: Icon(
                                      Icons.person_outline,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    validator: (val) => val!.length > 2 ? null : "please enter valid name"),
                                SizedBox(height: 1.h),
                                Text(
                                  "Emial",
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                CustomTextFormField(
                                  hintText: 'Enter Email',
                                  controller: controller.emailController,
                                  keyboardType: TextInputType.text,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  validator: (val) => GetUtils.isEmail(val!) ? null : 'Please enter valid email',
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "Phone",
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                CustomTextFormField(
                                  hintText: 'Enter Number',
                                  controller: controller.phoneController,
                                  keyboardType: TextInputType.text,
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  validator: (val) => val!.length > 6 ? null : "please enter valid phone number",
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "Password",
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Obx(
                                  () => CustomTextFormField(
                                    hintText: 'Enter Password',
                                    controller: controller.passwordController,
                                    isObscure: controller.passwordVisible.isFalse,
                                    maxLines: 1,
                                    keyboardType: TextInputType.text,
                                    prefixIcon: Icon(
                                      Icons.lock_clock_outlined,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Password is required';
                                      }
                                      if (val.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null; // Password is valid
                                    },
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.passwordVisible.value = !controller.passwordVisible.value;
                                      },
                                      icon: Icon(
                                        controller.passwordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  "Confirm password",
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                Obx(
                                  () => CustomTextFormField(
                                    hintText: 'Enter confirm password',
                                    controller: controller.confirmPasswordController,
                                    isObscure: controller.confirmPasswordVisible.isFalse,
                                    keyboardType: TextInputType.text,
                                    prefixIcon: Icon(
                                      Icons.lock_clock_outlined,
                                      size: 20,
                                      color: Colors.grey,
                                    ),
                                    maxLines: 1,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        return 'Password is required';
                                      }
                                      if (val != controller.passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null; // Password is valid
                                    },
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.confirmPasswordVisible.value = !controller.confirmPasswordVisible.value;
                                      },
                                      icon: Icon(
                                        controller.confirmPasswordVisible.value ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                        size: 24,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3.h),
                                Center(
                                  child: CustomElevatedButton(
                                    height: 6.h,
                                    width: 40.w,
                                    text: 'Register',
                                    buttonTextStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    backgroundColor:Colors.red.shade400.withOpacity(0.8),
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Already have an account?',style: TextStyle(color: Colors.white,fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 28,
                                      child: CustomTextButton(
                                        onPressed: () {
                                          Get.offAllNamed(Routes.SIGNIN);
                                        },
                                        text: 'Login now',
                                        textStyle: TextStyle(fontSize: 18,decoration: TextDecoration.underline),
                                        foregroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
