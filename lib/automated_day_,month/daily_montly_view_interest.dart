import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../drawer/my_drawer.dart';
import '../withdrawal/withdrawal.dart';
import 'daily_history.dart';
import 'daily_monthly_controller.dart';
import 'monthly_history.dart';

DayMonthController interestController = DayMonthController();

class dailyMonthlyinterestView extends StatefulWidget {
  const dailyMonthlyinterestView({Key? key}) : super(key: key);

  @override
  State<dailyMonthlyinterestView> createState() =>
      _dailyMonthlyinterestViewState();
}

class _dailyMonthlyinterestViewState extends State<dailyMonthlyinterestView> {
  double faceValueDaily = 0;
  double interestRateDaily = 0;
  double faceValueMonthly = 0;
  double interestRateMonthly = 0;
  double numberDaysMonthly = 0;
  @override
  Widget build(BuildContext context) {
    void dailyInterestCalculate() {
      return setState(
        () {
          faceValueDaily = double.tryParse(
                  interestController.dailyFaceValueController.text) ??
              0;
          interestRateDaily = double.tryParse(
                  interestController.dailyInterestRateController.text) ??
              0;
          interestController.interestResultDaily =
              (faceValueDaily * interestRateDaily) / 365;
        },
      );
    }

    void monthlyInterestCalculate() {
      return setState(
        () {
          faceValueMonthly = double.tryParse(
                  interestController.monthlyFaceValueController.text) ??
              0;
          interestRateMonthly = double.tryParse(
                  interestController.monthlyInterestRateController.text) ??
              0;
          numberDaysMonthly = double.tryParse(
                  interestController.monthlyDaysNumberController.text) ??
              0;

          interestController.monthlyinterestResult =
              (faceValueMonthly * interestRateMonthly * numberDaysMonthly) /
                  365;
          interestController.monthalyOpAdd();
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'daily & Monthly interest',
            style: GoogleFonts.cairo(
              fontSize: context.screenWidth * 5,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Automated interest accrual',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Daily interest',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
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
                      'Daily Interest = (Face Value * Interest Rate)  / 365 ',
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
                      controller: interestController.dailyFaceValueController,
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
                          interestController.dailyInterestRateController,
                      width: 120,
                      height: 60,
                      labelText: "Interest rate"),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Center(
                        child: Text(
                          "Result :  ${interestController.interestResultDaily.toStringAsFixed(2)}",
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
              SizedBox(
                height: context.screenHeight * 0.5,
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
                        dailyInterestCalculate();
                        interestController.dailyOpAdd();
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
                      Get.to(const DailyOPsHistory());
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

              // monthly
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Monthly interest',
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
                      'Monthly Interest = (Face Value * Interest Rate \n* Number of days in the month)  / 365 ',
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
                      controller: interestController.monthlyFaceValueController,
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
                          interestController.monthlyInterestRateController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          interestController.monthlyDaysNumberController,
                      width: 120,
                      height: 60,
                      labelText: "Month number days"),
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
                      '365',
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
                          "Result :  ${interestController.monthlyinterestResult.toStringAsFixed(2)}",
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
              const SizedBox(height: 10),
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
                        monthlyInterestCalculate();
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
                      Get.to(const MonthlyOPsHistory());
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
      width: 100,
      height: 40,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: labelText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
