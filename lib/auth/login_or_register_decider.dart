import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../starting_screens/first.dart';
import 'authenticate.dart';

class CheckFirstTimeUser extends StatefulWidget {
  const CheckFirstTimeUser({super.key});

  @override
  _CheckFirstTimeUserState createState() => _CheckFirstTimeUserState();
}

class _CheckFirstTimeUserState extends State<CheckFirstTimeUser> {
  bool isFirstTimeUser = true;

  @override
  void initState() {
    super.initState();
    checkFirstTimeUser();
  }

  Future<void> checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    setState(
      () {
        isFirstTimeUser = isFirstTime;
      },
    );

    if (isFirstTime) {
      await prefs.setBool('isFirstTime', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: isFirstTimeUser ? const First() : const Authenticate(),
      ),
    );
  }
}
