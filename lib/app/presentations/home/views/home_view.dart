import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../custom_widgets/custom_drawer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'xmtrade',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.red,
            child: Text(
              'AM',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildCard("Successful Deposits"),
              SizedBox(height: 16),
              _buildCard("Successful Withdrawals"),
              SizedBox(height: 16),
              _buildCard("Total investments"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(String title) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.orange, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "0.00 USDT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailColumn("Submitted", "₹0.00"),
                _buildDetailColumn("Pending", "₹0.00"),
                _buildDetailColumn("Rejected", "₹0.00"),
              ],
            ),
            Divider(color: Colors.white30),
            SizedBox(height: 8),
            Text(
              "You've requested to deposit ₹0.00. Where ₹0.00 is just initiated but not submitted.",
              style: TextStyle(color: Colors.white60, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailColumn(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white60, fontSize: 14),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }
}
