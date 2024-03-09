// import 'package:alraidah/main.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CostController {
//   late String thChosenJob = "";
//   late String complexity = "";
//   late String preferredDevelopment = "";

//   late TextEditingController thChosenJobController = TextEditingController();
//   late TextEditingController complexityController = TextEditingController();
//   late TextEditingController preferredDevelopmentController =
//       TextEditingController();

//   CollectionReference<Object> usersCollection =
//       FirebaseFirestore.instance.collection('users');

//   late DocumentReference userDocRef =
//       usersCollection.doc(userData.currentUserEmail);

//   Future<void> addClientInfo() async {
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userData.currentUserEmail)
//         .collection("investements")
//         .add(
//       {
//         'amount_invetsement': thChosenJob,
//         'duration-name': complexity,
//         'accrued_interest': preferredDevelopment,
//       },
//     );
//   }

//   Future<void> fetchInvestmentInfo() async {
//     DocumentSnapshot snapshot = (await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userData.currentUserEmail)
//         .collection("schedule_and_cost")
//         .doc()
//         .snapshots()) as DocumentSnapshot<Object?>;
//     if (snapshot.exists) {
//       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
//       Map<String, dynamic> documentData =
//           data['schedule_and_cost'] as Map<String, dynamic>;

//       thChosenJobController.text = documentData['chosen_job'] ?? '';
//       complexityController.text = documentData['complexity'] ?? '';
//       preferredDevelopmentController.text =
//           documentData['prefered_development'] ?? '';
//     }
//   }
// }
