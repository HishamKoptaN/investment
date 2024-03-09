import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../drawer/my_drawer.dart';
import '../withdrawal/withdrawal.dart';
import 'accrued_interest_history.dart';
import 'annual_accrued_controller.dart';
import 'annual_interest_history.dart';

AnnualAcctruedController annualAccruedController = AnnualAcctruedController();

class AnnualAndAccruedInterest extends StatefulWidget {
  const AnnualAndAccruedInterest({Key? key}) : super(key: key);

  @override
  State<AnnualAndAccruedInterest> createState() =>
      _AnnualAndAccruedInterestState();
}

class _AnnualAndAccruedInterestState extends State<AnnualAndAccruedInterest> {
  @override
  Widget build(BuildContext context) {
    void annualyInterestCalculate() {
      return setState(
        () {
          annualAccruedController.faceValueAnnual = double.tryParse(
                  annualAccruedController.faceValueDAnnualController.text) ??
              0;
          annualAccruedController.interestRateAnnual = double.tryParse(
                  annualAccruedController.interestRateAnnualController.text) ??
              0;
          annualAccruedController.interestRateAnnual = double.tryParse(
                  annualAccruedController
                      .daysNumberOfYearAnnualController.text) ??
              0;

          annualAccruedController.interestResultAnnual =
              (annualAccruedController.faceValueAnnual *
                      annualAccruedController.interestRateAnnual) /
                  365;
          annualAccruedController.annualOpAdd();
        },
      );
    }

    void accruedInterestCalculate() {
      return setState(
        () {
          annualAccruedController.faceValueAccured = double.tryParse(
                  annualAccruedController.faceValueAccruedController.text) ??
              0;
          annualAccruedController.interestRateAccured = double.tryParse(
                  annualAccruedController.interestRateAccuredController.text) ??
              0;
          annualAccruedController.maturityPeriodAccured = double.tryParse(
                  annualAccruedController
                      .maturityPeriodAccuredController.text) ??
              0;

          annualAccruedController.interestResultAccured =
              (annualAccruedController.faceValueAccured *
                      annualAccruedController.interestRateAccured) *
                  (annualAccruedController.maturityPeriodAccured) /
                  100;
          annualAccruedController.accruedOpAdd();
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Annual & accrued',
            style: GoogleFonts.cairo(
              fontSize: context.screenWidth * 6,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Withdrawal(),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Automated interest annual',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Annual interest',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: const Text(
                    'Annual Interest = (Face Value * Interest Rate) \n*(days number of year)  / 365 ',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '(',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                textField(
                    controller:
                        annualAccruedController.faceValueDAnnualController,
                    width: 120,
                    height: 50,
                    labelText: "Face value"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                textField(
                    controller:
                        annualAccruedController.interestRateAnnualController,
                    width: 120,
                    height: 50,
                    labelText: "Interest value"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 25,
                ),
                textField(
                    controller: annualAccruedController
                        .daysNumberOfYearAnnualController,
                    width: 140,
                    height: 50,
                    labelText: "days number of year"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ')',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  '/',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '365',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 35,
                ),
                Text(
                  '=',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    width: context.screenWidth * 50,
                    height: context.screenHeight * 5,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "Result :  ${annualAccruedController.interestResultAnnual.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: context.screenWidth * 3,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber, width: 2),
                ),
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {
                      annualyInterestCalculate();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(
                      Icons.calculate_rounded,
                      color: Colors.amber,
                      size: 30,
                    ),
                    label: const Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const AnnualOpsHistory());
                  },
                  child: const Text(
                    "History ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // monthly
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Accrued interest',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: const Text(
                    'Accrued Interest = (Face Value * Interest Rate \n* Maturity period)  / 100 ',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '(',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                textField(
                    controller:
                        annualAccruedController.faceValueAccruedController,
                    width: 120,
                    height: 60,
                    labelText: "Face value"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                textField(
                    controller:
                        annualAccruedController.interestRateAccuredController,
                    width: 120,
                    height: 60,
                    labelText: "Interest value"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ')',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '*',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                textField(
                    controller:
                        annualAccruedController.maturityPeriodAccuredController,
                    width: 150,
                    height: 60,
                    labelText: "Maturity period"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ')',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '/',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '100',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '=',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: Colors.grey, width: 2), // إضافة حدود
                    ),
                    child: Center(
                      child: Text(
                        "Result :  ${annualAccruedController.interestResultAccured.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: context.screenWidth * 3,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black, // لون الخلفية
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: Colors.amber, width: 2), // تحديد الحواف المستديرة
                ),
                child: Center(
                  child: TextButton.icon(
                    onPressed: () {
                      accruedInterestCalculate();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38, // لون الزر
                      elevation: 0, // إزالة الظل
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // تحديد الحواف المستديرة
                      ),
                    ),
                    icon: const Icon(
                      Icons.calculate_rounded,
                      color: Colors.amber,
                      size: 30,
                    ),
                    label: const Text(
                      'Calculate',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const AccruedOpsHistory());
                  },
                  child: const Text(
                    "History ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.5,
            ),
          ],
        ),
      ),
    );
  }
}

class textField extends StatelessWidget {
  const textField({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
    required this.labelText,
  });

  final TextEditingController controller;

  final double width;
  final double height;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 15),
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
