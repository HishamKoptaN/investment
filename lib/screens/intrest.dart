import 'package:bank/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../analyze/analyze_individual_view.dart';
import '../drawer/my_drawer.dart';
import '../identifying/identifying.dart';
import '../track_interest/trake_interst.dart';

class Intrest extends StatefulWidget {
  const Intrest({Key? key}) : super(key: key);

  @override
  State<Intrest> createState() => _IntrestState();
}

class _IntrestState extends State<Intrest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            'My interests',
            style: GoogleFonts.cairo(
                fontSize: context.screenWidth * 8,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                letterSpacing: 3.0),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: context.screenHeight * 5,
            width: double.infinity,
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                const AnalyzeIndividual(),
              );
            },
            child: Container(
              width: context.screenWidth * 75,
              height: context.screenHeight * 10,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Center(
                child: Text(
                  'Analyze individual\ninvestment performance',
                  style: GoogleFonts.cairo(fontSize: 20, color: Colors.blue),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.to(
                const TrackInterst(),
              );
            },
            child: Container(
              width: context.screenWidth * 75,
              height: context.screenHeight * 10,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Center(
                child: Text(
                  'Track interest earnings',
                  style: GoogleFonts.cairo(fontSize: 20, color: Colors.blue),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Identifying(),
                ),
              );
            },
            child: Container(
              width: context.screenWidth * 75,
              height: context.screenHeight * 10,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Center(
                child: Text(
                  'Identifying potential \n    and delinquency',
                  style: GoogleFonts.cairo(fontSize: 20, color: Colors.blue),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            'assets/intrest.png',
            width: context.screenWidth * 50,
            height: context.screenHeight * 45,
          )
        ],
      ),
    );
  }
}
