import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../navigate_bar_screen.dart';
import 'client_info_controller.dart';

ClientInfoController clientInfoController = ClientInfoController();

class ClientBuisnessInfo extends StatefulWidget {
  const ClientBuisnessInfo({super.key});

  @override
  _ClientBuisnessInfoState createState() => _ClientBuisnessInfoState();
}

class _ClientBuisnessInfoState extends State<ClientBuisnessInfo> {
  late bool _isEditing;

  @override
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
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Text(
                  'CLIENT BUISNESS\nINFORMATION',
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                FilledButton(
                  onPressed: () {
                    Get.to(const NavigateBarScreen());
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.black,
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
            StreamBuilder(
              stream: clientInfoController.userDocRef.snapshots(),
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
                              clientInfoController.buisness_name_controller,
                          isEditing: _isEditing,
                          label: const Text('Buisness Name'),
                        ),
                        textField(
                          controller:
                              clientInfoController.buisness_address_controller,
                          isEditing: _isEditing,
                          label: const Text("Buisness Address"),
                        ),
                        textField(
                          controller:
                              clientInfoController.buisness_email_controller,
                          isEditing: _isEditing,
                          label: const Text("Buisness Email"),
                        ),
                        textField(
                          controller: clientInfoController
                              .buisness_telephone_controller_controller,
                          isEditing: _isEditing,
                          label: const Text("Buisness Telephone"),
                        ),
                        textField(
                          controller: clientInfoController
                              .country_state_of_registration_controller,
                          isEditing: _isEditing,
                          label: const Text("Country / State of Registration"),
                        ),
                        textField(
                          controller: clientInfoController
                              .registration_number_controller,
                          isEditing: _isEditing,
                          label: const Text(
                              "Registration Number/EIN/TIN/CO GOVT ID"),
                        ),
                        textField(
                          controller: clientInfoController
                              .company_incorpation_state_controller,
                          isEditing: _isEditing,
                          label: const Text(
                              "Company incorporation State / Province"),
                        ),
                        textField(
                          controller:
                              clientInfoController.owner_directors_controller,
                          isEditing: _isEditing,
                          label: const Text("Owners / Directors of Company"),
                        ),
                        textField(
                          controller:
                              clientInfoController.year_founded_controller,
                          isEditing: _isEditing,
                          label: const Text("Year Founded"),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    child: _isEditing
                        ? ElevatedButton(
                            onPressed: () {
                              clientInfoController.addClientInfo();
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
