import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/config/color.dart';
import 'package:xm_trades/app/custom_widgets/custom_appBar.dart';

import '../../../../../custom_widgets/custom_text_field.dart';

class OpenTicket extends StatefulWidget {
  const OpenTicket({super.key});

  @override
  State<OpenTicket> createState() => _OpenTicketState();
}

class _OpenTicketState extends State<OpenTicket> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController subjectController = TextEditingController();
    TextEditingController messageController = TextEditingController();
    String? priority;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbar(
        title: 'Contact form',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Open Ticket", style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            Container(
              decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              )),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      controller: nameController,
                      width: 90.w,
                      height: 7.h,
                      hintText: "Name",
                      fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    SizedBox(height: 2.h),
                    CustomTextFormField(
                      controller: emailController,
                      width: 90.w,
                      height: 7.h,
                      hintText: "Email Address",
                      fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    SizedBox(height: 2.h),
                    CustomTextFormField(
                      controller: subjectController,
                      width: 90.w,
                      height: 7.h,
                      hintText: "Subject",
                      fieldstyle: const TextStyle(color: AppColors.black, fontSize: 16),
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    SizedBox(height: 2.h),
                    DropdownButtonFormField<String>(
                      value: priority,
                      items: ['High', 'Medium', 'Low']
                          .map((priority) => DropdownMenuItem(
                                value: priority,
                                child: Text(priority),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          priority = value!;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Priority',
                        hintStyle: TextStyle(color: AppColors.grey),
                        constraints: BoxConstraints(maxHeight: 7.h),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    TextField(
                      controller: messageController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(color: AppColors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.black,
                                foregroundColor: Colors.white,
                                fixedSize: Size(30.w, 5.h), // 70% of screen width and 6% of screen height
                                shape: const BeveledRectangleBorder(side: BorderSide(color: AppColors.red, width: 1)),
                              ),
                              child: const Text('Add file'),
                            ),
                            Text(
                              "1 file can be uploaded.\n Maximum upload size is 1024 Mb",
                              style: TextStyle(fontSize: 10, color: Colors.white),
                            )
                          ],
                        ),
                        Container(
                          height: 20.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text("No Image"),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.black,
                          foregroundColor: AppColors.white,
                          fixedSize: Size(80.w, 6.h), // 70% of screen width and 6% of screen height
                          shape: const BeveledRectangleBorder(side: BorderSide(color: AppColors.red, width: 1)),
                        ),
                        child: const Text('Add file'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// final _emailController = TextEditingController();
// final _subjectController = TextEditingController();
// final _messageController = TextEditingController();
// String _priority = 'High';
