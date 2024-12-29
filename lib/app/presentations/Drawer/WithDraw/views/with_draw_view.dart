import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/config/color.dart';
import 'package:xm_trades/app/custom_widgets/custom_appBar.dart';

import '../../../../custom_widgets/custom_text_field.dart';
import '../controllers/with_draw_controller.dart';


class WithDrawView extends GetView<WithDrawController> {
  const WithDrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithDrawController>(
        init: WithDrawController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar:CustomAppbar(title: 'Withdraw Funds',),
            body: SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Withdraw Funds",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "The fund will be withdrawal only from Interest Wallet. So make sure that you've sufficient balance to the interest wallet.",
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
                          shape: const BeveledRectangleBorder(side: BorderSide(color:AppColors.black, width: 1)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              size: 14,
                            ),
                            SizedBox(width: 1.h),
                            Text('Withdraw history'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Card(
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Method',
                                style: TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                              DropdownButtonFormField<String>(
                                value: controller.selectedGateway,
                                hint: Text('Select Gateway', style: TextStyle(color: Colors.black)),
                                dropdownColor: Colors.white,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                  filled: true,constraints: BoxConstraints(maxHeight: 6.h),
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
                              suffixText: 'USTD',
                              sufficColor: AppColors.black,
                              fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                              fillColor: AppColors.white,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                            ),
                              SizedBox(height: 30),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.black,
                                    foregroundColor: Colors.white,
                                    fixedSize: Size(80.w, 5.h), // 70% width, 6% height
                                    shape: const BeveledRectangleBorder(side: BorderSide(color: AppColors.red, width: 1)),
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
