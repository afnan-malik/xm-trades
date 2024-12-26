import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/profile_setting_controller.dart';

class ProfileSettingView extends GetView<ProfileSettingController> {
  const ProfileSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileSettingView'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Profile",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
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
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Full Name ',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                         TextField(
                          controller: controller.nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Full Name',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        const Text(
                          'E-Mail Address',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'E-Mail Address',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        const Text(
                          '  Mobile Number',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                         TextField(
                          controller: controller.numberController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        const Text(
                          'Address',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                         TextField(
                          controller: controller.addressController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Address',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        const Text(
                          'State',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                         TextField(
                          controller: controller.stateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'State',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        const Text(
                          'Zip Code',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                         TextField(
                          controller: controller.zipController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Zip Code',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        const Text(
                          'City',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                         TextField(
                          controller: controller.cityController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'City',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        const Text(
                          'Country',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                         TextField(
                          controller: controller.countryController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Country',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: const TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 2.h),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              fixedSize: Size(80.w, 5.h), // 70% width, 6% height
                              shape: const BeveledRectangleBorder(side: BorderSide(color: Colors.red, width: 1)),
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
