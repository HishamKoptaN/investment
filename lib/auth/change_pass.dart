import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helpers/input_field.dart';
import 'user_data_controller.dart';

UserDataController userDataController = UserDataController();

class ChangePass extends StatelessWidget {
  const ChangePass({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          const Positioned(
            child: SizedBox(
              height: double.infinity,
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 2 * MediaQuery.sizeOf(context).height / 3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(9999),
                bottomRight: Radius.circular(9999),
              ),
              color: Colors.black,
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 4,
            left: 20,
            child: Container(
              width: MediaQuery.sizeOf(context).width / 1.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                      'Your New Password Must Be  Differnt from Previously Used  Passwords',
                      style: GoogleFonts.cairo(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  MyInputField(
                      hintText: 'New Password',
                      icon: Icons.lock_outline,
                      controller: userDataController.newPasswordController),
                  const SizedBox(
                    height: 10,
                  ),
                  MyInputField(
                      hintText: 'Confirm Password',
                      icon: Icons.lock_outline,
                      controller: userDataController.confirmPasswordController),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      userDataController.changePassword();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
