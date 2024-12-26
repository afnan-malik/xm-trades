import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Change Password",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Card(
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Current Password',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const TextField(
                          // controller: controller.amountController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Password',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const TextField(
                          // controller: controller.amountController,
            
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Confirm Password',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const TextField(
                          // controller: controller.amountController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(height: 6.h),
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
