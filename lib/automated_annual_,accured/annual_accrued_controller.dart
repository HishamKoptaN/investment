import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/user_data_controller.dart';
import '../main.dart';

UserDataController userDataController = UserDataController();

class AnnualAcctruedController extends GetxController {
  TextEditingController faceValueDAnnualController = TextEditingController();
  TextEditingController interestRateAnnualController = TextEditingController();
  TextEditingController daysNumberOfYearAnnualController =
      TextEditingController();
  double faceValueAnnual = 0;
  double interestRateAnnual = 0;
  double interestResultAnnual = 0;
///////////////////////////////////////////////////////////////////
  TextEditingController faceValueAccruedController = TextEditingController();
  TextEditingController interestRateAccuredController = TextEditingController();
  TextEditingController maturityPeriodAccuredController =
      TextEditingController();

  double faceValueAccured = 0;
  double interestRateAccured = 0;
  double maturityPeriodAccured = 0;
  double interestResultAccured = 0;
  Future<void> annualOpAdd() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userDataController.currentUserEmail)
        .collection("annual_ops_history")
        .doc()
        .set(
      {
        "face_value": faceValueDAnnualController.text,
        "interest_rate": interestRateAnnualController.text,
        "days_number": daysNumberOfYearAnnualController.text,
        "interest_annual_result": (interestResultAnnual).toStringAsFixed(2),
      },
    );
  }

  Future<void> accruedOpAdd() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userDataController.currentUserEmail)
        .collection("accrued_ops_history")
        .doc()
        .set(
      {
        "face_value": faceValueAccruedController.text,
        "interest_rate": interestRateAccuredController.text,
        "maturity_period": maturityPeriodAccuredController.text,
        "interest_accured_result": (interestResultAccured).toStringAsFixed(2),
      },
    );
  }
}
