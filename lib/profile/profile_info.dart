import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../auth/user_data_controller.dart';
import '../navigate_bar_screen.dart';
import 'profile_info_controller.dart';

ProfileInfoController profileInfoController = ProfileInfoController();
UserDataController userData = UserDataController();

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late bool _isEditing;

  @override
  void initState() {
    super.initState();
    profileInfoController.fetchInfo();
    profileInfoController.full_name_controller = TextEditingController();
    profileInfoController.home_address_controller = TextEditingController();
    profileInfoController.user_email_controller = TextEditingController();
    profileInfoController.home_telephone_controller = TextEditingController();
    profileInfoController.date_of_birth_controller = TextEditingController();
    profileInfoController.passport_number_controller = TextEditingController();
    profileInfoController.passport_issue_date_controller =
        TextEditingController();
    profileInfoController.nationality_controller = TextEditingController();
    _isEditing = false;
  }

  @override
  void dispose() {
    profileInfoController.full_name_controller.dispose();
    profileInfoController.home_address_controller.dispose();
    profileInfoController.user_email_controller.dispose();
    profileInfoController.user_email_controller.dispose();
    profileInfoController.home_telephone_controller.dispose();
    profileInfoController.date_of_birth_controller.dispose();
    profileInfoController.passport_number_controller.dispose();
    profileInfoController.passport_issue_date_controller.dispose();
    profileInfoController.nationality_controller.dispose();

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
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              'Set up your information',
              style: GoogleFonts.cairo(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Share your private data to prove your  identity on our platform',
              style: GoogleFonts.cairo(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () {
                  Get.to(const NavigateBarScreen());
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
            ),
            StreamBuilder(
              stream: profileInfoController.userDocRef.snapshots(),
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
                              profileInfoController.full_name_controller,
                          isEditing: _isEditing,
                          label: const Text(
                            'Full Name',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        textField(
                          controller:
                              profileInfoController.home_address_controller,
                          isEditing: _isEditing,
                          label: const Text(
                            'Home Address',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        textField(
                          controller:
                              profileInfoController.user_email_controller,
                          isEditing: _isEditing,
                          label: const Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        textField(
                          controller:
                              profileInfoController.home_telephone_controller,
                          isEditing: _isEditing,
                          label: const Text(
                            'Home Telephone',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        textField(
                          controller:
                              profileInfoController.date_of_birth_controller,
                          isEditing: _isEditing,
                          label: const Text(
                            'Date of Birth / Place of Birth',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        textField(
                          controller:
                              profileInfoController.passport_number_controller,
                          isEditing: _isEditing,
                          label: const Text(
                            "Passport Number / Issuing Country",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        textField(
                          controller: profileInfoController
                              .passport_issue_date_controller,
                          isEditing: _isEditing,
                          label: const Text(
                            "Passport Issue Date / Expiry Date",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        textField(
                          controller:
                              profileInfoController.nationality_controller,
                          isEditing: _isEditing,
                          label: const Text(
                            "Nationality / SSN",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                child: _isEditing
                                    ? ElevatedButton(
                                        onPressed: () {
                                          _isEditing = false;

                                          setState(() {});

                                          profileInfoController.addProfileInfo;
                                        },
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                            (states) {
                                              return _isEditing
                                                  ? Colors.blue
                                                  : Colors.transparent;
                                            },
                                          ),
                                        ),
                                        child: Text(
                                          'Save',
                                          style: TextStyle(
                                            color: Colors.amber.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            shadows: [
                                              Shadow(
                                                color: Colors.green
                                                    .withOpacity(0.9),
                                                offset: const Offset(3, 2),
                                                blurRadius: 3,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox()),
                            ElevatedButton(
                              onPressed: _toggleEditing,
                              child: Text(
                                _isEditing ? 'Cancel' : 'Edit',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
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
              // prefixIcon: Icon(
              //   icon,
              // ),
              // border: InputBorder.none,
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
