import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/config/color.dart';
import 'package:xm_trades/app/custom_widgets/custom_appBar.dart';

import '../../../../custom_widgets/custom_text_field.dart';
import '../controllers/deposit_controller.dart';

class DepositView extends GetView<DepositController> {
  const DepositView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositController>(
        init: DepositController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar:CustomAppbar(title: 'Deposit Funds',),
            body: SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Deposit Funds",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Add funds using our system's gateway. The deposited amount will be credited to the deposit wallet. You'll just make investments from this wallet.",
                      style: TextStyle(color: Colors.black54),
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: Colors.white,
                          fixedSize: Size(50.w, 5.h), // 70% width, 6% height
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                              side: BorderSide(color: Colors.black, width: 1)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 14,
                            ),
                            SizedBox(width: 1.h),
                            Text('Deposit history'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Card(
                      child: Container(
                        height: 35.h,
                        decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Gateway',
                                style: TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              DropdownButtonFormField<String>(
                                value: controller.selectedGateway,
                                hint: Text('Select Gateway', style: TextStyle(color: Colors.black)),
                                dropdownColor: Colors.white,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                  filled: true,constraints:BoxConstraints(maxHeight: 6.h),
                                  fillColor: Colors.white,
                                ),
                                items: controller.gateways.map((String gateway) {
                                  return DropdownMenuItem<String>(
                                    value: gateway,
                                    child: Text(gateway),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  controller.selectedGateway = value;
                                },
                              ),
                              SizedBox(height: 20),
                              CustomTextFormField(
                                controller: controller.amountController,
                                keyboardType: TextInputType.phone,
                                width: 85.w,
                                height: 6.h,
                                hintText: "Amount",
                                fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                                fillColor: AppColors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.black,
                                    foregroundColor: Colors.white,
                                    fixedSize: Size(80.w, 5.h), // 70% width, 6% height
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(2),
                                        side: BorderSide(color: AppColors.red, width: 1)),
                                  ),
                                  child: Text('Submit'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
