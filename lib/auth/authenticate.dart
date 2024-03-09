import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_auth.dart';
import 'login_view.dart';
import 'user_data_controller.dart';

UserDataController userDataController = UserDataController();

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  SharedPreferences? sharedPref;
  bool showWhat = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    sharedPref = await SharedPreferences.getInstance();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (FirebaseAuth.instance.currentUser != null) {
          Get.to(const Biometric());
        }
        setState(
          () {
            showWhat = true;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return snapshot.hasData ? const Biometric() : const LoginView();
        },
      ),
    );
  }
}
