import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../investement/investment._controller.dart';
import '../pay_late/paylate.dart';

InvestementController investementController = InvestementController();

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'DASHBOARD',
                style: GoogleFonts.cairo(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Active investment portfolio',
              style: GoogleFonts.cairo(fontSize: 20, color: Colors.amber),
            ),
            const SizedBox(height: 20),
            StreamBuilder(
              stream: investementController.usersCollection.snapshots(),
              builder: (context, snapshot) {
                Map<String, dynamic> data = snapshot as Map<String, dynamic>;
                Map<String, dynamic> documentData =
                    data['invest_management'] as Map<String, dynamic>;

                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text('Wallet Name'),
                        ),
                        Container(
                          width: 170,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Text(documentData["d"]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text('Portfolio value'),
                        ),
                        Container(
                          width: 170,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text(''),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text('Investment history'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text(
                              '                                              '),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text(
                            'Current return value',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text(
                              '                                              '),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text('Current rate of return',
                              style: TextStyle(fontSize: 12)),
                        ),
                        Container(
                          width: 170,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text(''),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Active investment portfolio',
                      style:
                          GoogleFonts.cairo(fontSize: 20, color: Colors.amber),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Text(
                            'Type of piece of jewelry',
                            style: GoogleFonts.cairo(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const Icon(Icons.expand_circle_down_outlined)
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text('Investment value'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text(
                              '                                              '),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 140,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text('Current yield'),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text(
                              '                                              '),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Paylate(),
                              ),
                            );
                          },
                          child: Container(
                            width: 140,
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: const Text(
                              'Current rate of return',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        Container(
                          width: 170,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: const Text(''),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
