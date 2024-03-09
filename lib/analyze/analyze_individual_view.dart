// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../drawer/my_drawer.dart';
import 'package:bank/helpers/media_query.dart';

class AnalyzeIndividual extends StatefulWidget {
  const AnalyzeIndividual({Key? key}) : super(key: key);

  @override
  State<AnalyzeIndividual> createState() => _AnalyzeIndividualState();
}

class _AnalyzeIndividualState extends State<AnalyzeIndividual>
    with SingleTickerProviderStateMixin {
  TextEditingController the_date_of_purches_controller =
      TextEditingController();
  TextEditingController purchasing_price_controller = TextEditingController();

  TextEditingController number_of_investment_controller =
      TextEditingController();

  TextEditingController sale_date_controller = TextEditingController();

  TextEditingController selling_price_controller = TextEditingController();

  TextEditingController number_of_investments_controller =
      TextEditingController();

  double purchingPrice = 0;
  double sellingPrice = 0;
  double result = 0;
  void calculate() {
    purchingPrice = double.tryParse(purchasing_price_controller.text) ?? 0;
    sellingPrice = double.tryParse(selling_price_controller.text) ?? 0;
    setState(
      () {
        result = (sellingPrice - purchingPrice) / purchingPrice;
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Analyze individual investment performance     ',
            style: GoogleFonts.cairo(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                letterSpacing: 3.0),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(
                      'Analyze individual \ninvestment performance     ',
                      style: GoogleFonts.cairo(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                          letterSpacing: 3.0),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'The date of purchase',
                                  ),
                                  SizedBox(
                                    width: context.screenWidth * 2,
                                  ),
                                  MyTextField(
                                    controller: the_date_of_purches_controller,
                                    width: context.screenWidth * 45,
                                    height: context.screenHeight * 7.5,
                                    enabled: true,
                                    labelText: '',
                                  ),
                                ],
                              ),
                              SizedBox(height: context.screenHeight * 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Purchasing price',
                                  ),
                                  SizedBox(
                                    width: context.screenWidth * 2,
                                  ),
                                  MyTextField(
                                    controller: purchasing_price_controller,
                                    width: context.screenWidth * 45,
                                    height: context.screenHeight * 7.5,
                                    enabled: true,
                                    labelText: '',
                                  ),
                                ],
                              ),
                              SizedBox(height: context.screenHeight * 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Number of \ninvestment purchased',
                                  ),
                                  SizedBox(
                                    width: context.screenWidth * 2,
                                  ),
                                  MyTextField(
                                    controller: number_of_investment_controller,
                                    width: context.screenWidth * 45,
                                    height: context.screenHeight * 7.5,
                                    enabled: true,
                                    labelText: '',
                                  ),
                                ],
                              ),
                              SizedBox(height: context.screenHeight * 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Sale date',
                                  ),
                                  SizedBox(
                                    width: context.screenWidth * 2,
                                  ),
                                  MyTextField(
                                    controller: sale_date_controller,
                                    width: context.screenWidth * 45,
                                    height: context.screenHeight * 7.5,
                                    enabled: true,
                                    labelText: '',
                                  ),
                                ],
                              ),
                              SizedBox(height: context.screenHeight * 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Selling',
                                  ),
                                  SizedBox(
                                    width: context.screenWidth * 2,
                                  ),
                                  MyTextField(
                                    controller: selling_price_controller,
                                    width: context.screenWidth * 45,
                                    height: context.screenHeight * 7.5,
                                    enabled: true,
                                    labelText: '',
                                  ),
                                ],
                              ),
                              SizedBox(height: context.screenHeight * 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    text: 'Number of \ninvestment sold',
                                  ),
                                  SizedBox(
                                    width: context.screenWidth * 2,
                                  ),
                                  MyTextField(
                                    controller:
                                        number_of_investments_controller,
                                    width: context.screenWidth * 45,
                                    height: context.screenHeight * 7.5,
                                    enabled: true,
                                    labelText: '',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MyTextField(
                                          controller: selling_price_controller,
                                          width: context.screenWidth * 35,
                                          height: context.screenHeight * 7.5,
                                          enabled: false,
                                          labelText: 'Sale price ',
                                        ),
                                        const Text(
                                          '-',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        MyTextField(
                                          width: context.screenWidth * 35,
                                          height: context.screenHeight * 7.5,
                                          controller:
                                              purchasing_price_controller,
                                          enabled: false,
                                          labelText: 'Purchase price',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('/',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)),
                                        MyTextField(
                                          width: context.screenWidth * 45,
                                          height: context.screenHeight * 7.5,
                                          controller:
                                              purchasing_price_controller,
                                          enabled: false,
                                          labelText: 'Purchase price',
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Container(
                                        width: 200,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.grey,
                                              width: 2), // إضافة حدود
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Result :  ${result.toStringAsFixed(2)}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    context.screenWidth * 4,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: context.screenWidth * 50,
                                height: context.screenHeight * 7.5,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Colors.amber, width: 2),
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
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  MyText({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * 35,
      height: context.screenHeight * 7.5,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
    required this.enabled,
    required this.labelText,
  });

  final TextEditingController controller;

  final double width;
  final double height;
  final bool enabled;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        style: const TextStyle(color: Colors.black),
        enabled: enabled,
        controller: controller,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(),
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
