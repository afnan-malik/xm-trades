import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/config/color.dart';
import 'package:xm_trades/app/custom_widgets/custom_appBar.dart';
import 'package:xm_trades/app/custom_widgets/custom_text_field.dart';

import '../controllers/profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppbar(title: 'Profile Setting',),
      body:  SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profile",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: AppColors.black),),
                 GestureDetector (
                   onTap: (){},
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(
                        'AM',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Card(
                child: Container(
                  decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: controller.nameController,
                          label: 'Full Name',
                          width: 85.w,
                          height: 6.h,
                          hintText: "Name",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          controller: controller.emailController,
                          label: 'Email address',
                          width: 85.w,
                          height: 6.h,
                          hintText: "E Mail Address",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          controller: controller.numberController,
                          label: 'Mobile Number',
                          width: 85.w,
                          height: 6.h,
                          hintText: "Mobile number",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          controller: controller.addressController,
                          label: 'Address',
                          width: 85.w,
                          height: 6.h,
                          hintText: " Address",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          controller: controller.stateController,
                          label: 'State',
                          width: 85.w,
                          height: 6.h,
                          hintText: "State",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          controller: controller.zipController,
                          label: 'Zip code',
                          width: 85.w,
                          height: 6.h,
                          hintText: "Zip code",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          controller: controller.cityController,
                          label: 'City',
                          width: 85.w,
                          height: 6.h,
                          hintText: "City",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                        SizedBox(height: 2.h),
                        CustomTextFormField(
                          controller: controller.countryController,
                          label: 'Country',
                          width: 85.w,
                          height: 6.h,
                          hintText: "Country",
                          fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                          fillColor: AppColors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                        SizedBox(height: 2.h),
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
