import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'user_data_controller.dart';

final LocalAuthentication auth = LocalAuthentication();
UserDataController userDataController = UserDataController();

class Biometric extends StatelessWidget {
  const Biometric({super.key});

  @override
  Widget build(BuildContext context) {
    userDataController.authenticateWithBiometrics();
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(),
    );
  }
}
