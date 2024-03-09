import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../drawer/my_drawer.dart';

class Identifying extends StatefulWidget {
  const Identifying({Key? key}) : super(key: key);

  @override
  State<Identifying> createState() => _IdentifyingState();
}

class _IdentifyingState extends State<Identifying> {
  TextEditingController currentValueController = TextEditingController();
  TextEditingController bookValueController = TextEditingController();

  double currentValue = 0;
  double bookValue = 0;
  String purchingPrceSt = '';
  String bookValueSt = '';
  double result = 0;
  String finalResultText = "";
  void calculate() {
    currentValue = double.tryParse(currentValueController.text) ?? 0;
    bookValue = double.tryParse(bookValueController.text) ?? 0;
    setState(
      () {
        result = currentValue - bookValue;
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Identifying     ',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: context.screenHeight * 10),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Identifying potential and delinquency',
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: context.screenHeight * 3),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    "         Delinquency value =\n Current value - Book value",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: context.screenHeight * 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 20),
                      textField(
                        controller: currentValueController,
                        labelText: 'Current value',
                      ),
                      const Text('-',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      textField(
                          labelText: 'Book value',
                          controller: bookValueController),
                      const SizedBox(width: 20),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 60),
                      const Text(
                        '=',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: context.screenWidth * 5),
                      Container(
                        width: context.screenWidth * 50,
                        height: context.screenHeight * 10,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            "Result :  ${result.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: context.screenWidth / 10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.screenHeight * 2,
            ),
            Container(
              width: context.screenWidth * 50,
              height: context.screenHeight * 10,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber, width: 2),
              ),
              child: Center(
                child: TextButton.icon(
                  onPressed: () {
                    calculate();
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
                  label: Text(
                    'Calculate',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: context.screenWidth * 7,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: context.screenHeight * 1),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Note:',
                style: GoogleFonts.cairo(color: Colors.white, fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'The purpose of negative value is a decreasein market prices and the value of the  underlying assets of the investments and vice versa',
                style: GoogleFonts.cairo(color: Colors.amber, fontSize: 20),
              ),
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
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        height: 50,
        child: TextField(
          enabled: true,
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
            hintStyle: const TextStyle(color: Colors.amber),
            border: const OutlineInputBorder(),
          ),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
