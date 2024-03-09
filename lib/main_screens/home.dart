import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../auth/user_data_controller.dart';
import '../client_banking/client_banking.dart';
import '../client_information/client_info.dart';
import '../helpers/octagon.dart';
import '../profile/profile_info.dart';
import '../drawer/my_drawer.dart';

UserDataController userData = UserDataController();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Home     ',
            style: GoogleFonts.cairo(
              fontSize: context.screenWidth * 7,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -70,
            left: -80,
            child: SizedBox(
              width: context.screenWidth / 20,
              height: context.screenHeight / 20,
              child: CustomPaint(
                painter: OctagonPainter(),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 35,
            child: SizedBox(
              width: 180,
              height: 180,
              child: CustomPaint(
                painter: OctagonPainter(),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 150,
            child: SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: OctagonPainter(),
              ),
            ),
          ),
          Positioned(
            right: 15,
            bottom: 5,
            child: Image.asset(
              'assets/home_pic.png',
              width: 300,
              height: 320,
            ),
          ),
          Positioned(
            top: 45,
            left: 40,
            child: GestureDetector(
              onTap: () {
                Get.to(
                  const ProfileInfo(),
                );
              },
              child: Text(
                'Client\nName',
                style: GoogleFonts.cairo(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 140,
            child: GestureDetector(
              onTap: () {
                Get.to(const ClientBuisnessInfo());
              },
              child: Text(
                'Client\nBusiness',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: 255,
            child: GestureDetector(
              onTap: () {
                Get.to(const Clientalraidahing());
              },
              child: Text(
                'Client\nalraidahing',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
