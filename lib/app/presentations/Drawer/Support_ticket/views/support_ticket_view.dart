import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/presentations/Drawer/Support_ticket/views/content/open_ticket.dart';

import '../controllers/support_ticket_controller.dart';

class SupportTicketView extends GetView<SupportTicketController> {
  const SupportTicketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Ticket'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Support Tickets",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(OpenTicket());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fixedSize: Size(58.w, 6.h), // 70% width, 6% height
                shape: const BeveledRectangleBorder(side: BorderSide(color: Colors.red, width: 1)),
              ),
              child: Text(
                'open support ticket',
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 10.h,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(16)),
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
