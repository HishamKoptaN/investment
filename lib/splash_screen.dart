import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth/login_or_register_decider.dart';
import 'starting_screens/first.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.to(
          const CheckFirstTimeUser(),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(child: First()),
    );
  }
}
