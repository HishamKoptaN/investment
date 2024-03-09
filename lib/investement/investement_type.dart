import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../payment/paymob_controller.dart';
import '../profile/profile_info_controller.dart';
import 'investment._controller.dart';

PaymobController paymobController = PaymobController();
InvestementController investementController = InvestementController();
ProfileInfoController profileInfoController = ProfileInfoController();

class InvestementType extends StatefulWidget {
  const InvestementType({Key? key}) : super(key: key);

  @override
  State<InvestementType> createState() => _InvestementTypeState();
}

class _InvestementTypeState extends State<InvestementType> {
  bool? jewelry = false;
  bool? cash = false;
  bool? onlyOne = false;
  bool? constantly = false;
  String investementType = "";
  String implementaionType = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height - 150,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                // Container(
                //   width: double.infinity,
                //   height: 50,
                //   margin: const EdgeInsets.symmetric(horizontal: 50),
                //   decoration: const BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(20)),
                //       color: Colors.white),
                //   alignment: Alignment.center,
                //   child: Text(
                //     'Research and analysis',
                //     style: GoogleFonts.cairo(
                //         fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
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
                        fontSize: 20, fontWeight: FontWeight.bold),
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
                        investementController.investementType = investementType;
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
                        investementController.investementType = investementType;
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
                FilledButton(
                  onPressed: () {
                    paymobController.pay(
                        investementController.amount_value_controller.text);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    textStyle: const TextStyle(fontSize: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text('Continue to pay'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
