import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/my_drawer.dart';
import 'customer_controller.dart';
import 'package:bank/helpers/media_query.dart';

CustomerController customerController = CustomerController();

class CustomerAnalysis extends StatefulWidget {
  const CustomerAnalysis({Key? key}) : super(key: key);

  @override
  State<CustomerAnalysis> createState() => _CustomerAnalysisState();
}

class _CustomerAnalysisState extends State<CustomerAnalysis> {
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    customerController.fetchCustomerAnalysisInfo();
    customerController.writeYourGoalController = TextEditingController();
    customerController.styleOFinvestmentController = TextEditingController();
    customerController.totalExpensesController = TextEditingController();
    customerController.investmentDurationController = TextEditingController();
    _isEditing = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _toggleEditing() {
    setState(
      () {
        _isEditing = !_isEditing;
        if (!_isEditing) {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Analysis',
            style: GoogleFonts.cairo(
              fontSize: context.screenWidth * 7,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Customer Analysis',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Classification of investment preferences',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  textField(
                    controller: customerController.writeYourGoalController,
                    label: const Text('Write your investment goals'),
                    isEditing: _isEditing,
                  ),
                  textField(
                    controller: customerController.styleOFinvestmentController,
                    label: const Text('What is your style of investing?'),
                    isEditing: _isEditing,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Determine the high value :',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  textField(
                      controller: customerController.totalExpensesController,
                      isEditing: _isEditing,
                      label: const Text('Total expenses')),
                  textField(
                    label: const Text('Investment duration'),
                    controller: customerController.investmentDurationController,
                    isEditing: _isEditing,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: _isEditing
                        ? ElevatedButton(
                            onPressed: () {
                              customerController.addCustomerAnlysisInfo();
                              _isEditing = false;
                              Get.snackbar(
                                'تم تعديل البيانات بنجاح ',
                                'تم',
                                duration: const Duration(seconds: 3),
                                colorText: Colors.amber,
                                backgroundColor: Colors.black,
                                margin: const EdgeInsets.all(15),
                                icon: const Icon(
                                  Icons.message,
                                  color: Colors.amber,
                                ),
                              );
                              setState(() {});
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (states) {
                                  return _isEditing
                                      ? Colors.blue
                                      : Colors.transparent;
                                },
                              ),
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : const SizedBox()),
                ElevatedButton(
                  onPressed: _toggleEditing,
                  child: Text(
                    _isEditing ? 'Cancel' : 'Edit',
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class textField extends StatefulWidget {
  textField({
    super.key,
    required TextEditingController controller,
    required bool isEditing,
    required this.label,
  })  : _textEditingController = controller,
        _isEditing = isEditing;

  final TextEditingController _textEditingController;
  final bool _isEditing;
  final Text label;

  @override
  State<textField> createState() => _textFieldState();
}

class _textFieldState extends State<textField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: Align(
          alignment: Alignment.center,
          child: TextField(
            style: const TextStyle(color: Colors.black, fontSize: 20),
            controller: widget._textEditingController,
            enabled: widget._isEditing,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              label: widget.label,
              labelStyle: const TextStyle(
                  textBaseline: TextBaseline.alphabetic,
                  fontSize: 16,
                  color: Colors.blue),
              suffixStyle: const TextStyle(color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              alignLabelWithHint: true,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
      ),
    );
  }
}
