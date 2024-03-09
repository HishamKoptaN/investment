import 'package:flutter/material.dart';

import '../helpers/text_field.dart';
import 'user_data_controller.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    UserDataController userDataController = UserDataController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/lock.png',
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Reset Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Please enter your google email to receive password reset link ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
              hintText: 'Email',
              icon: Icons.email_outlined,
              controller: userDataController.emailPassResetController,
              labelText: '',
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  userDataController.passwordReset();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                ),
                child: const Text('Send Link', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
