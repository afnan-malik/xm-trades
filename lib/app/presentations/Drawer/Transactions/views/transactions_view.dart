import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xm_trades/app/custom_widgets/custom_appBar.dart';

import '../controllers/transactions_controller.dart';

class TransactionsView extends GetView<TransactionsController> {
  const TransactionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppbar(title: 'Transiction',),
      body: const Center(
        child: Text(
          'TransactionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
