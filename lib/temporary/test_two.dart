import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuthPageTest extends StatefulWidget {
  @override
  _PhoneAuthPageTestState createState() => _PhoneAuthPageTestState();
}

class _PhoneAuthPageTestState extends State<PhoneAuthPageTest> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late TextEditingController _phoneNumberController;
  late String _verificationId;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
  }

  Future<void> _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber:
          '+20${_phoneNumberController.text}', // Example: Change to your country code
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Sign in user with the credential
        await _auth.signInWithCredential(credential);
        // Navigate to the home page
        Navigator.pushReplacementNamed(context, '/home');
      },
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print('Verification failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {
        // Save the verification ID
        _verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto retrieval timeout
        _verificationId = verificationId;
      },
    );
  }

  Future<void> _verifySmsCode(String smsCode) async {
    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: smsCode,
    );
    // Sign in user with the credential
    await _auth.signInWithCredential(credential);
    // Navigate to the home page
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Phone Authentication'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: const TextStyle(color: Colors.black),
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _verifyPhoneNumber,
                child: const Text('Send Verification Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
