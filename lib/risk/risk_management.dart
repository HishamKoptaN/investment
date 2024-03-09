import 'package:bank/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/my_drawer.dart';
import 'risk_management_controller.dart';

RiskManagementController riskManagementController = RiskManagementController();

class RiskManagement extends StatefulWidget {
  const RiskManagement({Key? key}) : super(key: key);

  @override
  State<RiskManagement> createState() => _RiskManagementState();
}

class _RiskManagementState extends State<RiskManagement> {
  @override
  Widget build(BuildContext context) {
    void investmentRiskCalculate() {
      return setState(
        () {
          riskManagementController.marketRisk = double.tryParse(
                  riskManagementController.marketRiskController.text) ??
              0;
          riskManagementController.marketRiskWeight = double.tryParse(
                  riskManagementController.marketRiskWeightController.text) ??
              0;
          riskManagementController.creditRisk = double.tryParse(
                  riskManagementController.creditRiskController.text) ??
              0;
          riskManagementController.creditRiskWeight = double.tryParse(
                  riskManagementController.creditRiskWeightController.text) ??
              0;

          riskManagementController.liquidityRisk = double.tryParse(
                  riskManagementController.liquidityRiskController.text) ??
              0;

          riskManagementController.liquidityRiskWight = double.tryParse(
                  riskManagementController.liquidityRiskWightController.text) ??
              0;

          riskManagementController.investmentRiskResult =
              (riskManagementController.marketRisk *
                      riskManagementController.marketRiskWeight) +
                  (riskManagementController.creditRisk *
                      riskManagementController.creditRiskWeight) +
                  (riskManagementController.liquidityRisk *
                      riskManagementController.liquidityRiskWight);
        },
      );
    }

    void investmentRiskEcoCalculate() {
      return setState(
        () {
          riskManagementController.marketRiskEco = double.tryParse(
                  riskManagementController.marketRiskEcoController.text) ??
              0;
          riskManagementController.marketRiskWeightEco = double.tryParse(
                  riskManagementController
                      .marketRiskWeightEcoController.text) ??
              0;
          riskManagementController.creditRiskEco = double.tryParse(
                  riskManagementController.creditRiskEcoController.text) ??
              0;
          riskManagementController.creditRiskWeightEco = double.tryParse(
                  riskManagementController
                      .creditRiskWeightEcoController.text) ??
              0;

          riskManagementController.liquidityRiskEco = double.tryParse(
                  riskManagementController.liquidityRiskEcoController.text) ??
              0;

          riskManagementController.liquidityRiskWightEco = double.tryParse(
                  riskManagementController
                      .liquidityRiskWightEcoController.text) ??
              0;
          riskManagementController.economicGrowthExpectation = double.tryParse(
                  riskManagementController
                      .liquidityRiskWightEcoController.text) ??
              0;
          riskManagementController.economicGrowthExpectationWeight =
              double.tryParse(riskManagementController
                      .liquidityRiskWightEcoController.text) ??
                  0;

          riskManagementController.investmentRiskResultEco =
              (riskManagementController.marketRiskEco *
                      riskManagementController.marketRiskWeightEco) +
                  (riskManagementController.creditRiskEco *
                      riskManagementController.creditRiskWeightEco) +
                  (riskManagementController.liquidityRiskEco *
                      riskManagementController.liquidityRiskWightEco) +
                  (riskManagementController.economicGrowthExpectation *
                      riskManagementController.economicGrowthExpectationWeight);
        },
      );
    }

    void interestRateCalculate() {
      return setState(
        () {
          riskManagementController.supplyOfMoney = double.tryParse(
                  riskManagementController.supplyOfMoneyController.text) ??
              0;
          riskManagementController.demandForMoney = double.tryParse(
                  riskManagementController.demandForMoneyController.text) ??
              0;

          riskManagementController.interestRateResult =
              riskManagementController.supplyOfMoney /
                  riskManagementController.demandForMoney;
        },
      );
    }

    final size = MediaQuery.sizeOf(context).width;

    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Risk management',
            style: GoogleFonts.cairo(
              fontSize: context.screenWidth * 7,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Container(
                  width: size / 3,
                  height: 2000,
                  color: Colors.amber,
                ),
              ),
              Positioned(
                left: size / 3,
                child: Container(
                  width: size / 3,
                  height: 2000,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 2 * size / 3,
                child: Container(
                  width: size / 3,
                  height: 2000,
                  color: Colors.amber,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Text(
                        'Risk Management Tools',
                        style: GoogleFonts.cairo(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Evaluation of investment risks :',
                    style: GoogleFonts.cairo(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText(
                        text: ' ( ',
                      ),
                      MyTextField(
                        labelText: 'Market risk',
                        controller:
                            riskManagementController.marketRiskController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' * ',
                      ),
                      MyTextField(
                        labelText: 'Market risk weight',
                        controller:
                            riskManagementController.marketRiskWeightController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' ) ',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText(
                        text: ' +( ',
                      ),
                      MyTextField(
                        labelText: 'Credit risk',
                        controller:
                            riskManagementController.creditRiskController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' * ',
                      ),
                      MyTextField(
                        labelText: 'Credit risk weight',
                        controller:
                            riskManagementController.creditRiskWeightController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' )+ ',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText(
                        text: '   ( ',
                      ),
                      MyTextField(
                        labelText: 'Liquidity risk',
                        controller:
                            riskManagementController.liquidityRiskController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' * ',
                      ),
                      MyTextField(
                        labelText: 'Liquidity risk weight',
                        controller: riskManagementController
                            .liquidityRiskWightController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' )= ',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                              "Result :  ${riskManagementController.investmentRiskResult.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                            investmentRiskCalculate();
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
                  const SizedBox(height: 20),
                  Text(
                    'A variable that reflects investors’ expectations for economic ',
                    style: GoogleFonts.cairo(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Text(
                        'Risk Management Tools',
                        style: GoogleFonts.cairo(
                            fontSize: 23, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Evaluation of investment risks :',
                    style: GoogleFonts.cairo(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText(
                        text: ' ( ',
                      ),
                      MyTextField(
                        labelText: 'Market risk',
                        controller:
                            riskManagementController.marketRiskEcoController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' * ',
                      ),
                      MyTextField(
                        labelText: 'Market risk weight',
                        controller: riskManagementController
                            .marketRiskWeightEcoController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' ) ',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText(
                        text: ' +( ',
                      ),
                      MyTextField(
                        labelText: 'Credit risk',
                        controller:
                            riskManagementController.creditRiskEcoController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' * ',
                      ),
                      MyTextField(
                        labelText: 'Credit risk weight',
                        controller: riskManagementController
                            .creditRiskWeightEcoController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' )+ ',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText(
                        text: '   ( ',
                      ),
                      MyTextField(
                        labelText: 'Liquidity risk',
                        controller:
                            riskManagementController.liquidityRiskEcoController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' * ',
                      ),
                      MyTextField(
                        labelText: 'Liquidity risk weight',
                        controller: riskManagementController
                            .liquidityRiskWightEcoController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' ) ',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const MyText(
                        text: ' +( ',
                      ),
                      MyTextField(
                        labelText: 'Economic growth expection',
                        controller: riskManagementController
                            .economicGrowthExpectationController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' * ',
                      ),
                      MyTextField(
                        labelText: 'Economic growth expection weight',
                        controller: riskManagementController
                            .economicGrowthExpectationWeightController,
                        width: 120,
                        height: 40,
                      ),
                      const Row(
                        children: [
                          MyText(
                            text: ' ) ',
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      MyText(
                        text: ' = ',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                              "Result :  ${riskManagementController.investmentRiskResultEco.toStringAsFixed(2)}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                            investmentRiskEcoCalculate();
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: MyText(
                      text: 'Interest rates',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextField(
                        labelText: 'Supply of money',
                        controller:
                            riskManagementController.supplyOfMoneyController,
                        width: 120,
                        height: 40,
                      ),
                      const MyText(
                        text: ' / ',
                      ),
                      MyTextField(
                        labelText: 'Demand for money',
                        controller:
                            riskManagementController.demandForMoneyController,
                        width: 120,
                        height: 40,
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
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
                            "Result :  ${riskManagementController.interestRateResult.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
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
                            interestRateCalculate();
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.cairo(
          color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
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
    return Container(
      color: Colors.white,
      width: width,
      height: height,
      child: TextField(
        style: GoogleFonts.cairo(
          fontSize: 19,
          color: Colors.black,
        ),
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
