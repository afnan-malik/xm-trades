import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/config/color.dart';
import 'package:xm_trades/app/custom_widgets/custom_appBar.dart';
import 'package:xm_trades/app/presentations/Drawer/Support_ticket/views/content/open_ticket.dart';

import '../controllers/support_ticket_controller.dart';

class SupportTicketView extends GetView<SupportTicketController> {
  const SupportTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:CustomAppbar(title: 'Support Tickets',),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Support Tickets",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: AppColors.grey),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(OpenTicket());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: Size(35.w, 5.h), // 70% width, 6% height
                  shape:  BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                      side: const BorderSide(color: Colors.red, width: 1)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Open',
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward,size:2.5.h,)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 10.h,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text(
                  "Data not found",
                  style: TextStyle(color: Colors.blueGrey, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
