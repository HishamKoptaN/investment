import 'package:bank/helpers/media_query.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/my_drawer.dart';
import 'withdrawal_controller.dart';

WithdrawalController withdrawalController = WithdrawalController();

class Withdrawal extends StatefulWidget {
  const Withdrawal({Key? key}) : super(key: key);
  @override
  State<Withdrawal> createState() => _WithdrawalState();
}

class _WithdrawalState extends State<Withdrawal> {
  late bool _isEditing;

  @override
  void initState() {
    super.initState();
    withdrawalController.fetchInfo();
    withdrawalController.question_one_controller = TextEditingController();
    withdrawalController.question_two_controller = TextEditingController();
    withdrawalController.question_three_controller = TextEditingController();
    withdrawalController.question_four_controller = TextEditingController();
    withdrawalController.question_five_controller = TextEditingController();
    withdrawalController.question_six_controller = TextEditingController();
    withdrawalController.question_seven_controller = TextEditingController();
    withdrawalController.question_eight_controller = TextEditingController();
    _isEditing = false;
  }

  @override
  void dispose() {
    withdrawalController.question_one_controller.dispose();
    withdrawalController.question_two_controller.dispose();
    withdrawalController.question_three_controller.dispose();
    withdrawalController.question_four_controller.dispose();
    withdrawalController.question_five_controller.dispose();
    withdrawalController.question_six_controller.dispose();
    withdrawalController.question_seven_controller.dispose();
    withdrawalController.question_eight_controller.dispose();

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
            'Withdrawal',
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
      body: Stack(
        children: [
          Positioned(
            bottom: -50,
            child: Image.asset(
              'assets/withdrawal.png',
              width: MediaQuery.sizeOf(context).width - 100,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: context.screenWidth * 40,
                        height: context.screenHeight * 6,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: _isEditing
                                      ? ElevatedButton(
                                          onPressed: () {
                                            _isEditing = false;
                                            setState(() {});
                                            withdrawalController
                                                .addProfileInfo();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty
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
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.green
                                                      .withOpacity(
                                                          0.9), // لون الظل
                                                  offset: const Offset(3,
                                                      2), // الإزاحة الأفقية والرأسية للظل
                                                  blurRadius: 3, // قوة الظل
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
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.screenHeight * 2,
                  ),
                  const MyText(
                    text:
                        'What are the primary laws and regulations that govern financial activities in our country',
                  ),
                  textField(
                    controller: withdrawalController.question_one_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text:
                        'Which government agencies or regulatory bodies are responsible for overseeing financial activities',
                  ),
                  textField(
                    controller: withdrawalController.question_two_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text: 'What is the purpose of these laws and regulations',
                  ),
                  textField(
                    controller: withdrawalController.question_three_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text:
                        'How do these laws and regulations protect consumers and investors',
                  ),
                  textField(
                    controller: withdrawalController.question_four_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text:
                        'Are there specific laws or regulations that apply to different sectors of the financial industry, such as alraidahing, insurance, or securities',
                  ),
                  textField(
                    controller: withdrawalController.question_five_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text:
                        'Are there any licensing or registration requirements for financial institutions or professionals',
                  ),
                  textField(
                    controller: withdrawalController.question_six_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text:
                        'What are the reporting and disclosure requirements for financial institutions',
                  ),
                  textField(
                    controller: withdrawalController.question_seven_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text:
                        'Are there any restrictions or limitations on foreign investment or foreign financial institutions operating in our country',
                  ),
                  textField(
                    controller: withdrawalController.question_eight_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text:
                        'Are there any restrictions or limitations on foreign investment or foreign financial institutions operating in our country',
                  ),
                  textField(
                    controller: withdrawalController.question_nine_controller,
                    isEditing: _isEditing,
                  ),
                  const MyText(
                    text:
                        'Are there any restrictions or limitations on foreign investment or foreign financial institutions operating in our country',
                  ),
                  textField(
                    controller: withdrawalController.question_ten_controller,
                    isEditing: _isEditing,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        ],
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
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

class textField extends StatefulWidget {
  const textField({
    super.key,
    required TextEditingController controller,
    required bool isEditing,
  })  : _textEditingController = controller,
        _isEditing = isEditing;

  final TextEditingController _textEditingController;
  final bool _isEditing;

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
