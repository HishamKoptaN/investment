import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import '../auth/user_data_controller.dart';
import '../payment/paymob_controller.dart';

UserDataController userDataController = UserDataController();

class InvestementController {
  late String amountInvetsement = "";
  late String durationName = "";
  late String accruedInterest = "";
  late String finalAmount = "";
  late String investementType = "";
  late String implementaionType = "";
  late int amountInvetsementInt = int.parse(amountInvetsement);

  late TextEditingController amount_value_controller = TextEditingController();
  late TextEditingController duration_controller = TextEditingController();
  late TextEditingController interest_rate_controller = TextEditingController();
  late TextEditingController receivables_history_controller =
      TextEditingController();
  late TextEditingController guarantees_controller = TextEditingController();
  CollectionReference<Object> usersCollection =
      FirebaseFirestore.instance.collection('users');

  late DocumentReference userDocRef =
      usersCollection.doc(userDataController.currentUserEmail);
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;

  Future<void> pay() async {
    PaymobController().getPaymentKey(amountInvetsementInt, "OMR").then(
      (String paymentKey) {
        launchUrl(
          Uri.parse(
              "https://accept.paymob.com/api/acceptance/iframes/826181?payment_token=$paymentKey"),
        );
      },
    );
  }

  Future<void> launchURL() async {
    final Uri uri = Uri(scheme: "https", host: "www.alraideh.com");
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Future<void> addInvestmentInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .update(
      {
        'invest_management': {
          'amount_value': amount_value_controller.text,
          'duration': duration_controller.text,
          'interest_rate': interest_rate_controller.text,
          'receivables_history': receivables_history_controller.text,
          'guarantes': guarantees_controller.text,
        },
      },
    );
  }

  void getDataFromFirebase() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      String amountValueField = data['amount_value'] ?? '';
      String durationField = data['duration'] ?? '';
      String interestRateField = data['interest_rate'] ?? '';
      String receiablesField = data['receivables_history'] ?? '';
      String guarantesField = data['guarantes'] ?? '';
      amount_value_controller.text = amountValueField;
      duration_controller.text = durationField;
      interest_rate_controller.text = interestRateField;
      receivables_history_controller.text = receiablesField;
      guarantees_controller.text = guarantesField;
    }
  }

  Future<void> fetchInvestmentInfo() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .get();

    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> documentData =
          data['invest_management'] as Map<String, dynamic>;

      amount_value_controller.text = documentData['amount_value'] ?? '';
      duration_controller.text = documentData['duration'] ?? '';
      interest_rate_controller.text = documentData['interest_rate'] ?? '';
      receivables_history_controller.text =
          documentData['receivables_history'] ?? '';
      guarantees_controller.text = documentData['guarantes'] ?? '';
    }
  }

  Future<void> addClientInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .collection("investements")
        .add(
      {
        'amount_invetsement': amountInvetsement,
        'duration-name': durationName,
        'accrued_interest': accruedInterest,
        'final_amount': finalAmount,
        'investement_type': investementType,
        'implementaion_type': implementaionType,
        'investment_history': FieldValue.serverTimestamp(),
      },
    );
  }
}
