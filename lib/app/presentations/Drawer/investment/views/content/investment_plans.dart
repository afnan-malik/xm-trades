import 'package:flutter/material.dart';
import 'package:xm_trades/app/config/color.dart';
import 'package:xm_trades/app/custom_widgets/custom_appBar.dart';
import 'package:xm_trades/app/custom_widgets/custom_invest_plans.dart';

class InvestmentPlans extends StatelessWidget {
  const InvestmentPlans({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> plans = [
      {"title": "Plan A", "investment": "30\$", "profit": "10\$"},
      {"title": "Plan B", "investment": "50\$", "profit": "15\$"},
      {"title": "Plan C", "investment": "100\$", "profit": "25\$"},
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbar(title: 'Investment Plans'),
      body: Column(
        children: [
      Expanded(
        child: ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final plan = plans[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: custom_Invest_Plans(
                title: plans[index]["title"]!,
                investment: plans[index]["investment"]!,
                profit: plans[index]["profit"]!,
                onPress: () {
                  buyPlan(plan, context);
                  },
              ),
            );
          },
        ),
      )
        ],
      ),
    );
  }
}
// Logic to Buy a Plan
void buyPlan(Map<String, String> selectedPlan, BuildContext context) {

  print("User Selected Plan:");
  print("Title: ${selectedPlan['title']}");
  print("Investment: ${selectedPlan['investment']}");
  print("Profit: ${selectedPlan['profit']}");


  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Confirm Purchase"),
      content: Text(
        "Are you sure you want to buy ${selectedPlan['title']}?\n"
            "Investment: ${selectedPlan['investment']}\n"
            "Profit: ${selectedPlan['profit']}",
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            print("Plan Purchase Cancelled.");
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            print("Plan Purchased: ${selectedPlan['title']}");
          },
          child: Text("Buy Now"),
        ),
      ],
    ),
  );
}

