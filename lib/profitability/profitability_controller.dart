import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../auth/user_data_controller.dart';
import '../main.dart';

UserDataController userDataController = UserDataController();

class ProfitabilityController {
  TextEditingController salesController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController expensesController = TextEditingController();
  double sales = 0;
  double cost = 0;
  double expenses = 0;
  double netIncomeResult = 0;

  //////////////////////////////////////////////////////////////////////////////
  TextEditingController revenuesController = TextEditingController();
  TextEditingController costscontroller = TextEditingController();
  TextEditingController investmentsController = TextEditingController();
  double revenues = 0;
  double costs = 0;
  double investments = 0;
  double loanResult = 0;
  //////////////////////////////////////////////////////////////////////////////
  Future<void> netIncomeOpAdd() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userDataController.currentUserEmail)
        .collection("net_income_op_history")
        .doc()
        .set(
      {
        "sales": salesController.text,
        "cost": costController.text,
        "expenses": expensesController.text,
        "net_income_result": (netIncomeResult).toStringAsFixed(2),
      },
    );
  }

  Future<void> loanOpAdd() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userDataController.currentUserEmail)
        .collection("loan")
        .doc()
        .set(
      {
        "revenues": revenuesController.text,
        "costs": costscontroller.text,
        "investments": investmentsController.text,
        "loan_result": (loanResult).toStringAsFixed(2),
      },
    );
  }
}
