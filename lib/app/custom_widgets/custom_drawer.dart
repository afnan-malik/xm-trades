import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:xm_trades/app/config/color.dart';
import 'package:xm_trades/app/routes/app_pages.dart'; // Import the sizer package

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: DrawerHeader(
                decoration:  const BoxDecoration(color: AppColors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/xm_logo.webp', // Add your logo path
                      height: 6.h, // Use sizer for responsive height
                      width: 6.h, // Adjust width based on height for a square
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'ACCOUNT BALANCE',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 2.2.h,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        Text(
                          '0.00 USDT',
                          style: TextStyle(fontSize: 1.8.h, color: Colors.black87),
                        ),
                        Text(
                          '(Deposit Wallet)',
                          style: TextStyle(fontSize: 1.5.h, color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '0.00 USDT',
                          style: TextStyle(fontSize: 1.8.h, color: Colors.black87),
                        ),
                        Text(
                          '(Interest Wallet)',
                          style: TextStyle(fontSize: 1.5.h, color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Deposit and Withdraw Buttons
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.DEPOSIT);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      foregroundColor: AppColors.white,
                      fixedSize: Size(55.w, 5.h), // 70% of screen width and 6% of screen height
                      shape:  BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                          side: BorderSide(color: AppColors.red, width: 1)),
                    ),
                    child: const Text('Deposit'),
                  ),
                  SizedBox(height: 1.5.h),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.WITH_DRAW);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      foregroundColor: AppColors.white,
                      fixedSize: Size(55.w, 5.h), // 70% width, 6% height
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                          side: BorderSide(color: AppColors.black, width: 1)),
                    ),
                    child: const Text('Withdraw'),
                  ),
                ],
              ),
            ),
            SizedBox(height: .5.h),
            // Menu Items
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                child: ListView(
                  children: [
                    DrawerItem(
                        icon: Icons.dashboard,
                        label: 'Dashboard',
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    DrawerItem(
                        icon: Icons.bar_chart,
                        label: 'Investments',
                        onTap: () {
                          Get.toNamed(Routes.INVESTMENT);
                        }),
                    DrawerItem(
                        icon: Icons.wallet,
                        label: 'Deposit',
                        onTap: () {
                          Get.toNamed(Routes.DEPOSIT);
                        }),
                    DrawerItem(
                        icon: Icons.money,
                        label: 'Withdraw',
                        onTap: () {
                          Get.toNamed(Routes.WITH_DRAW);
                        }),
                    DrawerItem(
                        icon: Icons.receipt,
                        label: 'Transactions',
                        onTap: () {
                          Get.toNamed(Routes.TRANSACTIONS);
                        }),
                    DrawerItem(
                        icon: Icons.people,
                        label: 'Referrals',
                        onTap: () {
                          Get.toNamed(Routes.REFERRALS);
                        }),
                    DrawerItem(
                        icon: Icons.support_agent,
                        label: 'Support Ticket',
                        onTap: () {
                          Get.toNamed(Routes.SUPPORT_TICKET);
                        }),
                    DrawerItem(
                        icon: Icons.settings,
                        label: 'Profile Settings',
                        onTap: () {
                          Get.toNamed(Routes.PROFILE_SETTING);
                        }),
                    DrawerItem(
                        icon: Icons.lock,
                        label: 'Change Password',
                        onTap: () {
                          Get.toNamed(Routes.CHANGE_PASSWORD);
                        }),
                    DrawerItem(icon: Icons.logout, label: 'Logout', onTap: () {Get.toNamed(Routes.SIGNIN);}),
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

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function()? onTap;

  const DrawerItem({super.key, required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.grey),
      title: Text(
        label,
        style: TextStyle(color: AppColors.black, fontSize: 2.h, fontWeight: FontWeight.bold), // Using sizer for font size
      ),
      onTap: onTap,
    );
  }
}