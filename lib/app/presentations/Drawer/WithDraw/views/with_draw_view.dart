import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controllers/with_draw_controller.dart';


class WithDrawView extends GetView<WithDrawController> {
  const WithDrawView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithDrawController>(
        init: WithDrawController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Withdraw Funds'),
              backgroundColor: Colors.red,
            ),
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
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          fixedSize: Size(50.w, 5.h), // 70% width, 6% height
                          shape: const BeveledRectangleBorder(side: BorderSide(color: Colors.black, width: 1)),
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
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16)),
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
                                  border: OutlineInputBorder(),
                                  filled: true,
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
                              TextField(
                                controller: controller.amountController,
                                keyboardType: TextInputType.numberWithOptions(),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Amount',
                                  hintStyle: TextStyle(color: Colors.black),
                                  suffixText: 'USDT',
                                  suffixStyle: TextStyle(color: Colors.black,fontSize: 18) ,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(height: 20),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    foregroundColor: Colors.white,
                                    fixedSize: Size(80.w, 5.h), // 70% width, 6% height
                                    shape: const BeveledRectangleBorder(side: BorderSide(color: Colors.red, width: 1)),
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
