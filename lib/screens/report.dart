import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dashboard.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Dashboard(),
                ),
              );
            },
            child: Text(
              'FINANCIAL REPORTS',
              style: GoogleFonts.cairo(
                  color: Colors.amber,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            'assets/report.png',
            height: MediaQuery.sizeOf(context).height - 120,
          )
        ],
      ),
    );
  }
}
