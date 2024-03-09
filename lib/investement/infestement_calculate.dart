import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../drawer/my_drawer.dart';
import '../helpers/input_field.dart';
import '../payment/pay_home_screen.dart';
import 'investment._controller.dart';

InvestementController investementController = InvestementController();

class CalculateInvestement extends StatefulWidget {
  const CalculateInvestement({Key? key}) : super(key: key);

  @override
  State<CalculateInvestement> createState() => _CalculateInvestementState();
}

class _CalculateInvestementState extends State<CalculateInvestement>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController finalResultController = TextEditingController();
  double amount = 0;
  bool? jewelry = false;
  String durationName = "";
  bool? cash = false;
  bool? onlyOne = false;
  bool? constantly = false;
  String investementType = "";
  String implementaionType = "";
  bool? _sixMonths = false;
  bool? _oneYear = false;
  bool? _twoYears = false;
  int selectedBox = 1;
  double interestRate = 0;
  double finalValue = 0;
  double accruedInterest = 0;
  double finalAmount = 0;
  var price = int.tryParse(investementController.amountInvetsement);
  void duration() {
    if (_sixMonths == true) {
      durationName = " ستة اشهر";
    }
    if (_oneYear == true) {
      durationName == "سنه";
    }
    if (_twoYears == true) {
      durationName == "سنتين";
    }
  }

  void calculate() {
    amount = double.tryParse(amountController.text) ?? 0;
    finalAmount = amount / accruedInterest + amount;
    setState(
      () {
        investementController.amountInvetsement = amountController.text;
        investementController.durationName = durationName;
        investementController.finalAmount = finalAmount.toString();
        investementController.accruedInterest = accruedInterest.toString();
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159,
    ).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    amountController.dispose();
    finalResultController.dispose();

    super.dispose();
  }

  bool typeIsExtended = false;
  bool payIsExtended = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Invest Now     ',
              style: GoogleFonts.cairo(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  letterSpacing: 3.0),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Expanded(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 50),
                            RotationTransition(
                              turns: _rotationAnimation,
                              child: Transform.rotate(
                                angle: 150,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 100,
                                  height: 100,
                                  clipBehavior: Clip.antiAlias,
                                  child: Transform.rotate(
                                    angle: -150,
                                    child: Transform.scale(
                                      scale: 1.5,
                                      child: Image.asset(
                                        'assets/record_pic1.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            Transform.rotate(
                              angle: 150,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 100,
                                height: 100,
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                child: Transform.rotate(
                                  angle: -150,
                                  child: Text(
                                    'Calculate\nAccrued\nInterest',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            RotationTransition(
                              turns: _rotationAnimation,
                              child: Transform.rotate(
                                angle: 150,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 100,
                                  height: 100,
                                  clipBehavior: Clip.antiAlias,
                                  child: Transform.rotate(
                                    angle: -150,
                                    child: Transform.scale(
                                      scale: 1.5,
                                      child: Image.asset(
                                        'assets/record_pic2.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            Transform.rotate(
                              angle: 150,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 100,
                                  height: 100,
                                  alignment: Alignment.center,
                                  clipBehavior: Clip.antiAlias,
                                  child: Transform.rotate(
                                    angle: -150,
                                    child: Text(
                                      'Track\nOutstanding\nBalance',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            RotationTransition(
                              turns: _rotationAnimation,
                              child: Transform.rotate(
                                angle: 150,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: 100,
                                  height: 100,
                                  clipBehavior: Clip.antiAlias,
                                  child: Transform.rotate(
                                    angle: -150,
                                    child: Transform.scale(
                                      scale: 1.5,
                                      child: Image.asset(
                                        'assets/record_pic3.png',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(height: 25),
                                Center(
                                  child: MyInputField(
                                    hintText: 'Enter incoming payments',
                                    icon: Icons.bookmark_border_rounded,
                                    controller: amountController,
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Column(
                                  children: [
                                    Column(
                                      children: [
                                        CheckboxListTile(
                                          activeColor: Colors.amber.shade900,
                                          title: const Text(
                                            "ستة اشهر",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          value: _sixMonths,
                                          onChanged: (bool? value) {
                                            setState(
                                              () {
                                                _sixMonths = value;
                                                _oneYear = false;
                                                _twoYears = false;
                                                accruedInterest = 5;
                                                duration();
                                                calculate();
                                              },
                                            );
                                          },
                                        ),
                                        CheckboxListTile(
                                          activeColor: Colors.amber.shade900,
                                          title: const Text(
                                            'سنة',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          value: _oneYear,
                                          onChanged: (bool? value) {
                                            setState(
                                              () {
                                                _sixMonths = false;
                                                _oneYear = value;
                                                _twoYears = false;
                                                accruedInterest = 10;
                                                duration();
                                                calculate();
                                              },
                                            );
                                          },
                                        ),
                                        CheckboxListTile(
                                          activeColor: Colors.amber.shade900,
                                          title: const Text(
                                            'سنتين',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          value: _twoYears,
                                          onChanged: (bool? value) {
                                            setState(
                                              () {
                                                _sixMonths = false;
                                                _oneYear = false;
                                                _twoYears = value;
                                                accruedInterest = 15;
                                                duration();
                                                calculate();
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 175,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Accrued rate : %${accruedInterest.toString()}",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Container(
                                  width: 200,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.amber,
                                        width: 2), // إضافة حدود
                                  ),
                                  child: Center(
                                    child: Text(
                                      finalAmount.toStringAsFixed(2),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                const SizedBox(height: 15),
                                Container(
                                  width: 200,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.amber,
                                      width: 2,
                                    ),
                                  ),
                                  child: Center(
                                    child: TextButton.icon(
                                      onPressed: () {
                                        calculate();

                                        if (amountController.text.isEmpty) {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const AlertDialog(
                                              title:
                                                  Text("please enter amount"),
                                            ),
                                          );
                                        } else if (_sixMonths == false &&
                                            _oneYear == false &&
                                            _twoYears == false) {
                                          showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const AlertDialog(
                                              title: Text("please choose rate"),
                                            ),
                                          );
                                        } else {
                                          setState(
                                            () {
                                              typeIsExtended = !typeIsExtended;
                                            },
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.amber,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      icon: Icon(
                                        typeIsExtended
                                            ? Icons.arrow_downward
                                            : Icons.arrow_forward,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                      label: const Center(
                                        child: Text(
                                          'Continue your\ninvestment',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    if (typeIsExtended)
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              alignment: Alignment.center,
                              child: Text(
                                'Research and analysis',
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Container(
                              width: double.infinity,
                              height: 70,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.white),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  investementController.launchURL();
                                },
                                child: Text(
                                  'https://www.alraideh.com',
                                  style: GoogleFonts.cairo(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Choose investement type     ',
                                style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            CheckboxListTile(
                              activeColor: Colors.black,
                              title: const Text(
                                'jewelry',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: jewelry,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    jewelry = value;
                                    cash = false;
                                    investementType = "مجوهرات";
                                    investementController.investementType =
                                        investementType;
                                  },
                                );
                              },
                            ),
                            CheckboxListTile(
                              activeColor: Colors.black87,
                              title: const Text(
                                'cash',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: cash,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    jewelry = false;
                                    cash = true;
                                    investementType = "نقدي";
                                    investementController.investementType =
                                        investementType;
                                  },
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Choose implementation     ',
                                style: GoogleFonts.cairo(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            CheckboxListTile(
                              activeColor: Colors.black87,
                              title: const Text(
                                'constantly',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: constantly,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    onlyOne = false;
                                    constantly = true;
                                    implementaionType = "constantly";
                                    investementController.implementaionType =
                                        implementaionType;
                                  },
                                );
                              },
                            ),
                            CheckboxListTile(
                              activeColor: Colors.black,
                              title: const Text(
                                'Only one',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              value: onlyOne,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    onlyOne = value;
                                    constantly = false;
                                    implementaionType = "Only one";
                                    investementController.implementaionType =
                                        implementaionType;
                                  },
                                );
                              },
                            ),
                            Container(
                              width: 200,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.amber,
                                  width: 2,
                                ),
                              ),
                              child: TextButton.icon(
                                onPressed: () {
                                  // investementController.addClientInfo();
                                  investementController.pay();
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  textStyle: const TextStyle(fontSize: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                icon: Icon(
                                  payIsExtended
                                      ? Icons.arrow_downward
                                      : Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                label: const Center(
                                  child: Text(
                                    'Continuie pay',
                                    style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
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
