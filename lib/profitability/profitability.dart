import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../drawer/my_drawer.dart';
import 'loan_history.dart';
import 'net_income_history.dart';
import 'profitability_controller.dart';

ProfitabilityController profitabilityController = ProfitabilityController();

class ProfitabilityReports extends StatefulWidget {
  const ProfitabilityReports({Key? key}) : super(key: key);

  @override
  State<ProfitabilityReports> createState() => _ProfitabilityReportsState();
}

class _ProfitabilityReportsState extends State<ProfitabilityReports> {
  void calculate() {
    return setState(
      () {
        profitabilityController.sales =
            double.tryParse(profitabilityController.salesController.text) ?? 0;
        profitabilityController.cost =
            double.tryParse(profitabilityController.costController.text) ?? 0;
        profitabilityController.expenses =
            double.tryParse(profitabilityController.expensesController.text) ??
                0;

        profitabilityController.netIncomeResult =
            (profitabilityController.sales -
                profitabilityController.cost -
                profitabilityController.expenses);
        profitabilityController.netIncomeOpAdd();
      },
    );
  }

  void calculateLoan() {
    return setState(
      () {
        profitabilityController.revenues =
            double.tryParse(profitabilityController.revenuesController.text) ??
                0;
        profitabilityController.costs =
            double.tryParse(profitabilityController.costscontroller.text) ?? 0;
        profitabilityController.investments = double.tryParse(
                profitabilityController.investmentsController.text) ??
            0;

        profitabilityController.loanResult = (profitabilityController.revenues -
            profitabilityController.costs -
            profitabilityController.investments);
        profitabilityController.loanOpAdd();
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
            'Profitability reports',
            style: GoogleFonts.cairo(
              fontSize: context.screenWidth * 6,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Stack(
          children: [
            Positioned(
              top: 550,
              left: 0,
              width: 200,
              height: 225,
              child: Image.asset(
                'assets/profit.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text(
                  'Profitability Reports',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  'Track the overall performance of the business',
                  style: GoogleFonts.cairo(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Calculate net income',
                    style: GoogleFonts.cairo(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                  child: Text(
                    '     Net Income = Sale - \nCost - Expenses = Result',
                    style: GoogleFonts.cairo(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    textField(
                      controller: profitabilityController.salesController,
                      labelText: 'Sales',
                      widt: 120,
                      height: 40,
                      enable: true,
                    ),
                    Text(
                      '  -  ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    textField(
                      controller: profitabilityController.costController,
                      labelText: 'Cost',
                      widt: 120,
                      height: 40,
                      enable: true,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      '  -  ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    textField(
                      controller: profitabilityController.expensesController,
                      labelText: 'Expenses',
                      widt: 120,
                      height: 40,
                      enable: true,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 140),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 170,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: Colors.grey, width: 2), // إضافة حدود
                        ),
                        child: Center(
                          child: Text(
                            "Result :  ${profitabilityController.netIncomeResult.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 170,
                        height: 70,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                const NetIncomeHsitory(),
                              );
                            },
                            child: const Text(
                              "History ",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ROI analysis for different loan types',
                    style: GoogleFonts.cairo(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber),
                                child: Text(
                                  'ROI = Revenues - Costs -Investments',
                                  style: GoogleFonts.cairo(fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              textField(
                                controller:
                                    profitabilityController.revenuesController,
                                labelText: 'Revenues',
                                widt: 125,
                                height: 50,
                                enable: true,
                              ),
                              Text(
                                ' - ',
                                style: GoogleFonts.cairo(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              textField(
                                controller:
                                    profitabilityController.costscontroller,
                                labelText: 'Costs',
                                widt: 125,
                                height: 50,
                                enable: true,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                ' - ',
                                style: GoogleFonts.cairo(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              textField(
                                controller: profitabilityController
                                    .investmentsController,
                                labelText: 'Ivestments',
                                widt: 125,
                                height: 50,
                                enable: true,
                              ),
                            ],
                          ),
                          Container(
                            width: 200,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: Center(
                              child: Text(
                                "Result :  ${profitabilityController.loanResult.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: 200,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.amber, width: 2),
                            ),
                            child: Center(
                              child: TextButton.icon(
                                onPressed: () {
                                  calculateLoan();
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
                                    fontSize: 30,
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
                                  Get.to(
                                    const LoanHistory(),
                                  );
                                },
                                child: const Text(
                                  "History ",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
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
    required this.widt,
    required this.height,
    required this.enable,
  });

  final TextEditingController controller;
  final String labelText;
  final double widt;
  final double height;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        width: widt,
        height: height,
        child: TextField(
          enabled: enable, // تعطيل الإدخال
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
