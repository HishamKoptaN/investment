import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../auth/user_data_controller.dart';
import '../drawer/my_drawer.dart';
import 'pay_late_controller.dart';

PayLateController payLateController = PayLateController();
UserDataController userDataController = UserDataController();

class Paylate extends StatefulWidget {
  const Paylate({Key? key}) : super(key: key);

  @override
  State<Paylate> createState() => _PaylateState();
}

late bool _isEditing;

class _PaylateState extends State<Paylate> {
  @override
  void initState() {
    super.initState();
    payLateController.getPayLateInfo();
    payLateController.deserved_amount_controller = TextEditingController();
    payLateController.payment_due_date_controller = TextEditingController();
    _isEditing = false;
  }

  @override
  void dispose() {
    payLateController.deserved_amount_controller.dispose();
    payLateController.payment_due_date_controller.dispose();
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
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Late payments     ',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'List of late payments',
              style:
                  GoogleFonts.cairo(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            StreamBuilder(
              stream: payLateController.userDocRef.snapshots(),
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
                        textField(
                          controller:
                              payLateController.deserved_amount_controller,
                          isEditing: _isEditing,
                          label: const Text('deserved amount'),
                        ),
                        textField(
                          controller:
                              payLateController.payment_due_date_controller,
                          isEditing: _isEditing,
                          label: const Text("payment due date"),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: _isEditing
                        ? ElevatedButton(
                            onPressed: () {
                              payLateController.addPayLateInfo();
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
                                  fontSize: 18,
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
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 2),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/late.png',
                width: context.screenWidth * 50,
                height: context.screenHeight * 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  MyText({
    super.key,
    required this.data,
    required this.fontsize,
    required this.width,
    required this.height,
  });
  String data;
  double fontsize;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      width: width,
      height: height,
      child: Center(
        child: Text(
          data,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black,
              fontSize: fontsize,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class textField extends StatefulWidget {
  const textField({
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
