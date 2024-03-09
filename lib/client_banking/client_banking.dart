import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../client_information/client_info.dart';
import 'client_banking_controller.dart';

ClientalraidahingController clientalraidahingController =
    ClientalraidahingController();

class Clientalraidahing extends StatefulWidget {
  const Clientalraidahing({Key? key}) : super(key: key);

  @override
  State<Clientalraidahing> createState() => _ClientalraidahingState();
}

class _ClientalraidahingState extends State<Clientalraidahing> {
  late bool _isEditing;
  void initState() {
    super.initState();
    clientInfoController.fetchInfo();
    clientInfoController.buisness_name_controller = TextEditingController();
    clientInfoController.buisness_address_controller = TextEditingController();
    clientInfoController.buisness_email_controller = TextEditingController();
    clientInfoController.country_state_of_registration_controller =
        TextEditingController();
    clientInfoController.buisness_telephone_controller_controller =
        TextEditingController();
    clientInfoController.registration_number_controller =
        TextEditingController();
    clientInfoController.company_incorpation_state_controller =
        TextEditingController();
    clientInfoController.owner_directors_controller = TextEditingController();
    clientInfoController.year_founded_controller = TextEditingController();
    _isEditing = false;
  }

  @override
  void dispose() {
    clientInfoController.buisness_name_controller.dispose();
    clientInfoController.buisness_address_controller.dispose();
    clientInfoController.buisness_email_controller.dispose();
    clientInfoController.country_state_of_registration_controller.dispose();
    clientInfoController.buisness_telephone_controller_controller.dispose();
    clientInfoController.registration_number_controller.dispose();
    clientInfoController.company_incorpation_state_controller.dispose();
    clientInfoController.owner_directors_controller.dispose();
    clientInfoController.year_founded_controller.dispose();

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
      backgroundColor: Colors.amber.shade500,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              children: [
                Text(
                  'CLIENT BUISNESS\nINFORMATION',
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    FilledButton(
                      onPressed: () {
                        Get.to(
                          const Clientalraidahing(),
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      child: Text('Close',
                          style: GoogleFonts.cairo(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
            StreamBuilder(
              stream: clientalraidahingController.userDocRef.snapshots(),
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
                          controller: clientalraidahingController
                              .business_name_controller,
                          isEditing: _isEditing,
                          label: const Text('Buisness Name'),
                        ),
                        textField(
                          controller: clientalraidahingController
                              .alraidah_name_controller,
                          isEditing: _isEditing,
                          label: const Text("Bank Name"),
                        ),
                        textField(
                          controller: clientalraidahingController
                              .alraidah_address_controller,
                          isEditing: _isEditing,
                          label: const Text(
                              "Bank Address/address,city,state,postal"),
                        ),
                        textField(
                          controller: clientalraidahingController
                              .alraidah_officer_controller,
                          isEditing: _isEditing,
                          label: const Text("Bank Officer"),
                        ),
                        textField(
                          controller: clientalraidahingController
                              .email_address_controller,
                          isEditing: _isEditing,
                          label: const Text("E-mail Address"),
                        ),
                        textField(
                          controller:
                              clientalraidahingController.telephone_controller,
                          isEditing: _isEditing,
                          label: const Text("telephone No / Fax No"),
                        ),
                        textField(
                          controller: clientalraidahingController
                              .swift_code_acc_num_controller,
                          isEditing: _isEditing,
                          label: const Text("Swift Code Account Number"),
                        ),
                        textField(
                          controller: clientalraidahingController
                              .account_name_controller,
                          isEditing: _isEditing,
                          label: const Text("Account Name"),
                        ),
                        textField(
                          controller: clientalraidahingController
                              .beneficiary_name_controller,
                          isEditing: _isEditing,
                          label: const Text("Beneficiary Name"),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                child: _isEditing
                                    ? ElevatedButton(
                                        onPressed: () {
                                          _isEditing = false;
                                          Get.snackbar(
                                            'تم تعديل البيانات بنجاح ',
                                            'تم',
                                            duration:
                                                const Duration(seconds: 3),
                                            colorText: Colors.amber,
                                            backgroundColor: Colors.black,
                                            margin: const EdgeInsets.all(15),
                                            icon: const Icon(
                                              Icons.message,
                                              color: Colors.amber,
                                            ),
                                          );

                                          setState(() {});

                                          clientalraidahingController
                                              .addalraidahingInfo();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (states) {
                                              return _isEditing
                                                  ? Colors.black
                                                  : Colors.transparent;
                                            },
                                          ),
                                        ),
                                        child: const Text(
                                          'Save',
                                          style: TextStyle(
                                              color: Colors.amber,
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    : const SizedBox()),
                            const SizedBox(
                              width: 3,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              onPressed: _toggleEditing,
                              child: Text(
                                _isEditing ? 'Cancel' : 'Edit',
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
