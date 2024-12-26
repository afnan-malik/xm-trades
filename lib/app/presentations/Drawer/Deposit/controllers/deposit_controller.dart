import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DepositController extends GetxController {
  //TODO: Implement DepositController
  String? selectedGateway;
  final List<String> gateways = ['Select One', 'TRC20', 'ERC20', 'BSC'];
  final TextEditingController amountController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
