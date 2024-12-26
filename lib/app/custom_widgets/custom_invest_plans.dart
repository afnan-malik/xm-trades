import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class custom_Invest_Plans extends StatelessWidget {
  final String title;
  final String investment;
  final String profit;
  void Function()? onPress;

    custom_Invest_Plans({super.key, required this.title,required this.onPress, required this.investment, required this.profit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.white)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoBox(title: 'Investment', value: investment),
                    InfoBox(title: 'Daily Profit', value: profit),
                    InfoBox(title: 'Max. Earn', value: 'Unlimited'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Center(
              child: ElevatedButton(
                onPressed: onPress,
                child: Text('Get it Now'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const InfoBox({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 3.h),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
