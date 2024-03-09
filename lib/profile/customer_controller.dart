import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomerController {
  TextEditingController writeYourGoalController = TextEditingController();
  TextEditingController styleOFinvestmentController = TextEditingController();
  TextEditingController totalExpensesController = TextEditingController();
  TextEditingController investmentDurationController = TextEditingController();

  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late DocumentReference userDocRef = usersCollection.doc(currentUserEmail);

  Future<void> addCustomerAnlysisInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserEmail)
        .update(
      {
        'customer_analysis': {
          'goals': writeYourGoalController.text,
          'style_of_investment': styleOFinvestmentController.text,
          'total_expenses': totalExpensesController.text,
          'investment_duration': investmentDurationController.text,
        },
      },
    );
  }

  void getDataFromFirebase() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserEmail)
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      String writeYourGoal = data['goals'] ?? '';
      String styleOFinvestment = data['style_of_investment'] ?? '';

      String totalExpenses = data['total_expenses'] ?? '';

      String investmentDuration = data['investment_duration'] ?? '';

      writeYourGoalController.text = writeYourGoal;
      styleOFinvestmentController.text = styleOFinvestment;
      totalExpensesController.text = totalExpenses;
      investmentDurationController.text = investmentDuration;
    } else {}
  }

  Future<void> fetchCustomerAnalysisInfo() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserEmail)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> documentData =
          data['customer_analysis'] as Map<String, dynamic>;

      writeYourGoalController.text = documentData['goals'] ?? '';
      styleOFinvestmentController.text =
          documentData['style_of_investment'] ?? '';
      totalExpensesController.text = documentData['total_expenses'] ?? '';
      investmentDurationController.text =
          documentData['investment_duration'] ?? '';
    }
  }
}
