import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/config/color.dart';
import 'package:xm_trades/app/custom_widgets/custom_appBar.dart';

import '../../../../custom_widgets/custom_text_field.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbar(
        title: 'Password',
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Change Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Card(
                child: Container(
                  height: 55.h,
                  decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          label: 'Current Password',
                          width: 85.w,
                          height: 6.h,
                          hintText: "Password",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          label: 'Password',
                          width: 85.w,
                          height: 6.h,
                          hintText: "Password",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          label: 'Confirm Password',
                          width: 85.w,
                          height: 6.h,
                          hintText: "Confirm Password",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        SizedBox(height: 6.h),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.black,
                              foregroundColor: Colors.white,
                              fixedSize: Size(80.w, 5.h), // 70% width, 6% height
                              shape: const BeveledRectangleBorder(side: BorderSide(color: AppColors.red, width: 1)),
                            ),
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
