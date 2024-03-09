import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WithdrawalController {
  TextEditingController question_one_controller = TextEditingController();
  TextEditingController question_two_controller = TextEditingController();
  TextEditingController question_three_controller = TextEditingController();
  TextEditingController question_four_controller = TextEditingController();
  TextEditingController question_five_controller = TextEditingController();
  TextEditingController question_six_controller = TextEditingController();
  TextEditingController question_seven_controller = TextEditingController();
  TextEditingController question_eight_controller = TextEditingController();
  TextEditingController question_nine_controller = TextEditingController();

  TextEditingController question_ten_controller = TextEditingController();

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late DocumentReference userDocRef = usersCollection.doc(currentUserEmail);
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;

  Future<void> addProfileInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserEmail)
        .update(
      {
        'drawal_questions': {
          'question_one': question_one_controller.text,
          'question_two': question_two_controller.text,
          'question_three': question_three_controller.text,
          'question_four': question_four_controller.text,
          'question_five': question_five_controller.text,
          'question_six': question_six_controller.text,
          'question_seven': question_seven_controller.text,
          'question_eight': question_eight_controller.text,
          'question_nine': question_nine_controller.text,
          'question_ten': question_ten_controller.text,
        },
      },
    );
    print("data sent");
  }

  Future<void> fetchInfo() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserEmail)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> documentData =
          data['drawal_questions'] as Map<String, dynamic>;

      question_one_controller.text = documentData['question_one'] ?? '';
      question_two_controller.text = documentData['question_two'] ?? '';
      question_three_controller.text = documentData['question_three'] ?? '';
      question_four_controller.text = documentData['question_four'] ?? '';
      question_five_controller.text = documentData['question_five'] ?? '';
      question_six_controller.text = documentData['question_six'] ?? '';
      question_seven_controller.text = documentData['question_seven'] ?? '';
      question_eight_controller.text = documentData['question_eight'] ?? '';
      question_eight_controller.text = documentData['question_nine'] ?? '';

      question_eight_controller.text = documentData['question_TEN'] ?? '';
    } else {}
  }
}
