import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../auth/user_data_controller.dart';

UserDataController userDataController = UserDataController();

class PayLateController {
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  TextEditingController deserved_amount_controller = TextEditingController();
  TextEditingController payment_due_date_controller = TextEditingController();

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late DocumentReference userDocRef =
      usersCollection.doc(userDataController.currentUserEmail);
  Future<void> addPayLateInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .update(
      {
        'pay_late': {
          'deserved_amount': deserved_amount_controller.text,
          'payment_due_date': payment_due_date_controller.text,
        },
      },
    );
  }

  Future<void> getPayLateInfo() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> documentData =
          data['pay_late'] as Map<String, dynamic>;
      deserved_amount_controller.text = documentData['deserved_amount'] ?? '';
      payment_due_date_controller.text = documentData['payment_due_date'] ?? '';
    } else {}
  }
}
