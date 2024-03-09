import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../client_information/client_info_controller.dart';
import '../investement/my_investments.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  ClientInfoController clientInfoController = ClientInfoController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Center(
          child: Text(
            '',
            style: GoogleFonts.cairo(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                letterSpacing: 3.0),
          ),
        ),
      ),
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 50,
            child: Container(
              width: 150,
              height: 150,
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset('assets/client_info_pic1.png'),
            ),
          ),
          Positioned(
            top: 150,
            right: 50,
            child: Container(
              width: 150,
              height: 150,
              decoration: const ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset('assets/client_info_pic2.png'),
            ),
          ),
          Positioned(
            top: 260,
            left: 30,
            child: Text(
              'Client\nInformation',
              style: GoogleFonts.cairo(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 380,
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  width: MediaQuery.sizeOf(context).width - 60,
                  height: 50,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      ClientInfoController().userDateSignUp(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const DeleteAccountDialog();
                      },
                    );
                  },
                  child: Container(
                    color: Colors.black,
                    width: MediaQuery.sizeOf(context).width - 60,
                    height: 50,
                    child: Center(
                      child: Text(
                        'Send Request to delete your account',
                        style: GoogleFonts.cairo(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const MyInvestments());
                  },
                  child: Container(
                    color: Colors.black,
                    width: MediaQuery.sizeOf(context).width - 60,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Text(
                          'Investment History',
                          style: GoogleFonts.cairo(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        const Icon(
                          size: 50,
                          Icons.forward_rounded,
                          color: Colors.amberAccent,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteAccountDialog extends StatefulWidget {
  const DeleteAccountDialog({super.key});

  @override
  State<DeleteAccountDialog> createState() => _DeleteAccountDialogState();
}

class _DeleteAccountDialogState extends State<DeleteAccountDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Account"),
      content: const Text("Are you sure you want to delete your account? "),
      actions: [
        TextButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection("delete_request")
                .doc(userData.currentUserEmail)
                .set({});

            Navigator.of(context).pop(true);
          },
          child: const Text(
            "Yes",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
