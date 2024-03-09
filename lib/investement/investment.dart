import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'investment._controller.dart';

class Investment extends StatefulWidget {
  const Investment({Key? key}) : super(key: key);

  @override
  State<Investment> createState() => _InvestmentState();
}

class _InvestmentState extends State<Investment> {
  InvestementController investementController = InvestementController();
  late bool _isEditing;

  @override
  void initState() {
    super.initState();
    investementController.fetchInvestmentInfo();
    investementController.amount_value_controller = TextEditingController();
    investementController.duration_controller = TextEditingController();
    investementController.interest_rate_controller = TextEditingController();
    investementController.receivables_history_controller =
        TextEditingController();
    investementController.guarantees_controller = TextEditingController();

    _isEditing = false;
  }

  @override
  void dispose() {
    investementController.amount_value_controller.dispose();
    investementController.duration_controller.dispose();
    investementController.interest_rate_controller.dispose();
    investementController.receivables_history_controller.dispose();
    investementController.guarantees_controller.dispose();

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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.amber,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: Text(
                    'Investment Management',
                    style: GoogleFonts.cairo(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                StreamBuilder(
                  stream: investementController.userDocRef.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyTextField(
                              controller:
                                  investementController.amount_value_controller,
                              isEditing: _isEditing,
                              label: const Text('Amount Value'),
                            ),
                            MyTextField(
                              controller:
                                  investementController.duration_controller,
                              isEditing: _isEditing,
                              label: const Text('Duration'),
                            ),
                            MyTextField(
                              controller: investementController
                                  .interest_rate_controller,
                              isEditing: _isEditing,
                              label: const Text("Intrest Rate"),
                            ),
                            MyTextField(
                              controller: investementController
                                  .receivables_history_controller,
                              isEditing: _isEditing,
                              label: const Text("Receivables history"),
                            ),
                            MyTextField(
                              controller:
                                  investementController.guarantees_controller,
                              isEditing: _isEditing,
                              label: const Text("Guarantees"),
                            ),
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    child: _isEditing
                                        ? ElevatedButton(
                                            onPressed: () {
                                              investementController
                                                  .addInvestmentInfo();
                                              _isEditing = false;
                                              Get.snackbar(
                                                'تم تعديل البيانات بنجاح ',
                                                'تم',
                                                duration:
                                                    const Duration(seconds: 3),
                                                colorText: Colors.amber,
                                                backgroundColor: Colors.black,
                                                margin:
                                                    const EdgeInsets.all(15),
                                                icon: const Icon(
                                                  Icons.message,
                                                  color: Colors.amber,
                                                ),
                                              );

                                              setState(() {});
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty
                                                      .resolveWith<Color>(
                                                (states) {
                                                  return _isEditing
                                                      ? Colors.black
                                                      : Colors.transparent;
                                                },
                                              ),
                                            ),
                                            child: const Text('Save'),
                                          )
                                        : const SizedBox()),
                                ElevatedButton(
                                  onPressed: _toggleEditing,
                                  child: Text(_isEditing ? 'Cancel' : 'Edit'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            Positioned(
              bottom: -5,
              child: Image.asset(
                'assets/inves_pic.png',
                width: 170,
                height: 170,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  const MyTextField({
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
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
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
