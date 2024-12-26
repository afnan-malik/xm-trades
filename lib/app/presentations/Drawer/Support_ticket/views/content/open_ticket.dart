import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/custom_widgets/custom_elevated_button.dart';

class OpenTicket extends StatefulWidget {
   const OpenTicket({super.key});

  @override
  State<OpenTicket> createState() => _OpenTicketState();
}

class _OpenTicketState extends State<OpenTicket> {
  @override
  Widget build(BuildContext context) {

    TextEditingController emailController=TextEditingController();
    TextEditingController subjectController=TextEditingController();
    TextEditingController messageController=TextEditingController();
    String? priority;

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contact Form'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Open Ticket", style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold)),
            Container(
             decoration: BoxDecoration(
               color: Colors.black,
               borderRadius: BorderRadius.circular(18)
             ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email Address',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    TextField(
                      controller: subjectController,
                      decoration: InputDecoration(
                        hintText: 'Subject',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                        ),
                      ),
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
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    TextField(
                      controller: messageController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none
                        ),
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
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                foregroundColor: Colors.white,
                                fixedSize: Size(30.w, 5.h), // 70% of screen width and 6% of screen height
                                shape: const BeveledRectangleBorder(side: BorderSide(color: Colors.red, width: 1)),
                              ),
                              child: const Text('Add file'),
                            ),
                            Text("1 file can be uploaded.\n Maximum upload size is 1024 Mb",style: TextStyle(fontSize: 10,color: Colors.white),)
                          ],
                        ),
                        Container(
                          height: 20.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: Text("No Image"),),
                        )
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          fixedSize: Size(80.w, 6.h), // 70% of screen width and 6% of screen height
                          shape: const BeveledRectangleBorder(side: BorderSide(color: Colors.red, width: 1)),
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
