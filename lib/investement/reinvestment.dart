import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:bank/helpers/media_query.dart';

import '../drawer/my_drawer.dart';
import 'investment._controller.dart';

InvestementController investementController = InvestementController();

class Reinvestment extends StatefulWidget {
  const Reinvestment({Key? key}) : super(key: key);

  @override
  State<Reinvestment> createState() => _ReinvestmentState();
}

class _ReinvestmentState extends State<Reinvestment> {
  final TextEditingController _numberCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "+9682236984";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Reinvestment',
            style: GoogleFonts.cairo(
                fontSize: context.screenWidth * 7,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                letterSpacing: 3.0),
          ),
        ),
      ),
      backgroundColor: Colors.amber,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                Image.asset(
                  'assets/reinvestment.png',
                  width: context.screenWidth * 40,
                  height: context.screenWidth * 60,
                ),
                Text(
                  'Reinvestment',
                  style: GoogleFonts.cairo(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: context.screenHeight * 3),
            Text(
              'Click here and invest your money',
              style:
                  GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.screenHeight * 2),
            Text(
              'Business E-mail Address',
              style:
                  GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.screenHeight * 2),
            GestureDetector(
              onTap: () {
                investementController.launchURL();
              },
              child: Container(
                width: context.screenWidth * 75,
                height: context.screenWidth * 15,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    'https://www.alraideh.com',
                    style: GoogleFonts.cairo(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 3,
            ),
            Text(
              'Business Telephone No / Fax No',
              style:
                  GoogleFonts.cairo(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: context.screenHeight * 1),
            Container(
              width: context.screenWidth * 75,
              height: context.screenWidth * 15,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white),
              child: ElevatedButton(
                child: Text(
                  "+9682236984",
                  style: GoogleFonts.cairo(
                      fontSize: context.screenWidth * 7,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                onPressed: () async {
                  FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
