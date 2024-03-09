import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/user_data_controller.dart';

UserDataController userDataController = UserDataController();

class ClientInfoController {
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  TextEditingController buisness_name_controller = TextEditingController();
  TextEditingController buisness_address_controller = TextEditingController();
  TextEditingController buisness_email_controller = TextEditingController();
  TextEditingController country_state_of_registration_controller =
      TextEditingController();
  TextEditingController buisness_telephone_controller_controller =
      TextEditingController();
  TextEditingController registration_number_controller =
      TextEditingController();
  TextEditingController company_incorpation_state_controller =
      TextEditingController();
  TextEditingController owner_directors_controller = TextEditingController();
  TextEditingController year_founded_controller = TextEditingController();
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late DocumentReference userDocRef =
      usersCollection.doc(userDataController.currentUserEmail);
  String userSignUpDate = '';
  Future<void> addClientInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .update(
      {
        'document_name': {
          'buisness_name': buisness_name_controller.text,
          'buisness_address': buisness_address_controller.text,
          'buisness_email': buisness_email_controller.text,
          'country_state_of_registration':
              country_state_of_registration_controller.text,
          'buisness_telephone': buisness_telephone_controller_controller.text,
          'registration_number': registration_number_controller.text,
          'company_incorpation_state':
              company_incorpation_state_controller.text,
          'owner_directors': owner_directors_controller.text,
          'year_founded': year_founded_controller.text,
        },
      },
    );
  }

  Future<void> fetchInfo() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> documentData =
          data['document_name'] as Map<String, dynamic>;
      buisness_name_controller.text = documentData['buisness_name'] ?? '';
      buisness_address_controller.text = documentData['buisness_address'] ?? '';
      buisness_email_controller.text = documentData['buisness_email'] ?? '';
      country_state_of_registration_controller.text =
          documentData['country_state_of_registration'] ?? '';
      buisness_telephone_controller_controller.text =
          documentData['buisness_telephone'] ?? '';
      registration_number_controller.text =
          documentData['registration_number'] ?? '';
      company_incorpation_state_controller.text =
          documentData['company_incorpation_state'] ?? '';
      owner_directors_controller.text = documentData['owner_directors'] ?? '';
      year_founded_controller.text = documentData['year_founded'] ?? '';
    } else {}
  }

  FutureBuilder<DateTime?> userDateSignUp() {
    Future<DateTime?> getSignUpDate() async {
      try {
        DocumentSnapshot<Map<String, dynamic>> userData =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(currentUserEmail)
                .get();

        if (userData.exists) {
          Timestamp signUpTimestamp = userData.get('sign_Up_date');
          return signUpTimestamp.toDate();
        } else {
          return null;
        }
      } catch (error) {
        return null;
      }
    }

    return FutureBuilder<DateTime?>(
      future: getSignUpDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('حدث خطأ: ${snapshot.error}');
        } else if (snapshot.hasData) {
          DateTime? signUpDate = snapshot.data;
          return Center(
            child: Text(
              'Sign up date : ${signUpDate != null ? '${signUpDate.year}/${signUpDate.month}/${signUpDate.day} ${signUpDate.hour}:${signUpDate.minute}' : "لا يوجد"}',
              style: GoogleFonts.cairo(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          );
        } else {
          return const Text('لا يوجد تاريخ تسجيل');
        }
      },
    );
  }
}
