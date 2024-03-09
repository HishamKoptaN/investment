import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/login_view.dart';
import 'first.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        showModalBottomSheet(
          context: context,
          barrierColor: Colors.transparent,
          isDismissible: true,
          isScrollControlled: true,
          enableDrag: false,
          builder: (context) {
            return PopScope(
              canPop: false,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Terms and Conditions',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      margin: const EdgeInsets.all(10),
                      child: const SingleChildScrollView(
                        child: Text(
                          termsAndConditions,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilledButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('isFirstTime', false);
                            Get.to(
                              const LoginView(),
                            );
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: const TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Text('I Agree'),
                        ),
                        FilledButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setBool('isFirstTime', true);

                            Get.to(
                              const First(),
                            );
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            textStyle: const TextStyle(fontSize: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: const Text('I Disagree'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}

const String termsAndConditions =
    'Important tearms on investor and app subscriber to be the owner of the investment :\n1. His funds are legal and far from suspicions ( money laundering + fakecards + the owner must be sure of thesource of his funds 100%.\n2. The company does not bear any officialsin illegal funds.\n3. We are a 100% Omani company in theinvestment of gold raw materials and nottrading, shares or cryptocurrencies of allkinds.\n4. We respect the investor and place himunder the responsibility of the company.\n5. To have a healthy and true excitement/Leading Jewellery Company is your best and right choice to build an independentand healthy life in all respects.';
