import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';  // Import Sizer package

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return const MyApp();  // Wrap MyApp with Sizer
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,  // Define initial route from AppPages
      getPages: AppPages.routes,       // Define your routes in AppPages
    );
  }
}
