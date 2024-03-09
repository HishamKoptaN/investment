import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../auth/user_data_controller.dart';
import '../main.dart';

UserDataController userDataController = UserDataController();

class ClientalraidahingController {
  TextEditingController business_name_controller = TextEditingController();
  TextEditingController alraidah_name_controller = TextEditingController();
  TextEditingController alraidah_address_controller = TextEditingController();
  TextEditingController alraidah_officer_controller = TextEditingController();
  TextEditingController email_address_controller = TextEditingController();
  TextEditingController telephone_controller = TextEditingController();
  TextEditingController swift_code_acc_num_controller = TextEditingController();
  TextEditingController account_name_controller = TextEditingController();
  TextEditingController beneficiary_name_controller = TextEditingController();
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late DocumentReference userDocRef =
      usersCollection.doc(userDataController.currentUserEmail);

  Future<void> addalraidahingInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .update(
      {
        'client_alraidahing': {
          'buisness_name': business_name_controller.text,
          'alraidah_name': alraidah_name_controller.text,
          'alraidah_address': alraidah_address_controller.text,
          'alraidah_officer': alraidah_officer_controller.text,
          'email_address': email_address_controller.text,
          'telephone': telephone_controller.text,
          'swift_code_acc_num': swift_code_acc_num_controller.text,
          'account_name': account_name_controller.text,
          'beneficiary_name': beneficiary_name_controller.text,
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
      String buisnessNameField = data['buisness_name'] ?? '';
      String alraidahNameField = data['alraidah_name'] ?? '';
      String alraidahAddressField = data['alraidah_address'] ?? '';
      String alraidahOfficerField = data['alraidah_officer'] ?? '';
      String emailAddressField = data['email_address'] ?? '';
      String telephoneField = data['telephone'] ?? '';
      String swiftCodeNumField = data['swift_code_acc_num'] ?? '';
      String accountNameField = data['account_name'] ?? '';
      String beneficiaryNameField = data['beneficiary_name'] ?? '';
      business_name_controller.text = buisnessNameField;
      alraidah_name_controller.text = alraidahNameField;
      alraidah_address_controller.text = alraidahAddressField;
      alraidah_officer_controller.text = alraidahOfficerField;
      email_address_controller.text = emailAddressField;
      telephone_controller.text = telephoneField;
      swift_code_acc_num_controller.text = swiftCodeNumField;
      account_name_controller.text = accountNameField;
      beneficiary_name_controller.text = beneficiaryNameField;
    }
  }

  Future<void> fetchalraidahingInfo() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userDataController.currentUserEmail)
        .get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      Map<String, dynamic> documentData =
          data['client_alraidahing'] as Map<String, dynamic>;
      business_name_controller.text = documentData['buisness_name'] ?? '';
      alraidah_name_controller.text = documentData['alraidah_name'] ?? '';
      alraidah_address_controller.text = documentData['alraidah_address'] ?? '';
      alraidah_officer_controller.text = documentData['alraidah_officer'] ?? '';
      email_address_controller.text = documentData['email_address'] ?? '';
      telephone_controller.text = documentData['telephone'] ?? '';
      swift_code_acc_num_controller.text =
          documentData['swift_code_acc_num'] ?? '';
      account_name_controller.text = documentData['account_name'] ?? '';
      beneficiary_name_controller.text = documentData['beneficiary_name'] ?? '';
    }
  }
}
