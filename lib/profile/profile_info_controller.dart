import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../auth/user_data_controller.dart';
import '../main.dart';

UserDataController userDataController = UserDataController();

class ProfileInfoController {
  TextEditingController full_name_controller = TextEditingController();
  TextEditingController home_address_controller = TextEditingController();
  TextEditingController user_email_controller = TextEditingController();
  TextEditingController home_telephone_controller = TextEditingController();
  TextEditingController date_of_birth_controller = TextEditingController();
  TextEditingController passport_number_controller = TextEditingController();
  TextEditingController passport_issue_date_controller =
      TextEditingController();
  TextEditingController nationality_controller = TextEditingController();
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late DocumentReference userDocRef =
      usersCollection.doc(userDataController.currentUserEmail);

  Future<void> addProfileInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .update(
      {
        'profile_info': {
          'full_name': full_name_controller.text,
          'home_address': home_address_controller.text,
          'user_email': user_email_controller.text,
          'home_telephone': home_telephone_controller.text,
          'data_of_birth': date_of_birth_controller.text,
          'passport_number_issuing_country': passport_number_controller.text,
          'passport_issue_date': passport_issue_date_controller.text,
          'user_nationality': nationality_controller.text,
        },
      },
    );
    print("data sent");
  }

  Future<void> fetchInfo() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> documentData =
          data['profile_info'] as Map<String, dynamic>;

      // تعيين القيم للكنترولرات
      full_name_controller.text = documentData['full_name'] ?? '';
      home_address_controller.text = documentData['home_address'] ?? '';
      user_email_controller.text = documentData['user_email'] ?? '';
      home_telephone_controller.text = documentData['home_telephone'] ?? '';
      date_of_birth_controller.text = documentData['data_of_birth'] ?? '';
      passport_number_controller.text =
          documentData['passport_number_issuing_country'] ?? '';
      passport_issue_date_controller.text =
          documentData['passport_issue_date'] ?? '';
      nationality_controller.text = documentData['user_nationality'] ?? '';
    } else {
      print('Document does not exist');
    }
  }
}
