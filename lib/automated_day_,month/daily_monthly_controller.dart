import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth/user_data_controller.dart';

UserDataController userData = UserDataController();

class DayMonthController extends GetxController {
  TextEditingController dailyFaceValueController = TextEditingController();
  TextEditingController dailyInterestRateController = TextEditingController();
  double monthlyinterestResult = 0;

  //////////////////////////////////////////////////////////////////////////////
  TextEditingController monthlyFaceValueController = TextEditingController();
  TextEditingController monthlyInterestRateController = TextEditingController();
  TextEditingController monthlyDaysNumberController = TextEditingController();
  double interestResultDaily = 0;

  Future<void> dailyOpAdd() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.currentUserEmail)
        .collection("daily_ops_history")
        .doc()
        .set(
      {
        "face_value": dailyFaceValueController.text,
        "interest_rate": dailyInterestRateController.text,
        "interest_daily_result": (interestResultDaily).toStringAsFixed(2),
      },
    );
  }

  Future<void> monthalyOpAdd() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.currentUserEmail)
        .collection("monthly_ops_history")
        .doc()
        .set(
      {
        "monthly_face_value": monthlyFaceValueController.text,
        "monthly_interest_rate": monthlyFaceValueController.text,
        "month_days_number": monthlyInterestRateController.text,
        "monthly_Interest_result": (monthlyinterestResult).toStringAsFixed(2),
      },
    );
  }
}
