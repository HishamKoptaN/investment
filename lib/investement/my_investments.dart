import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../auth/user_data_controller.dart';
import '../drawer/my_drawer.dart';
import 'investment.dart';

class MyInvestments extends StatefulWidget {
  const MyInvestments({super.key});

  @override
  State<MyInvestments> createState() => _MyInvestmentsState();
}

UserDataController userData = UserDataController();

class _MyInvestmentsState extends State<MyInvestments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'My Investments',
              style: GoogleFonts.cairo(
                  fontSize: context.screenWidth * 7,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  letterSpacing: 3.0),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 700,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .doc(userData.currentUserEmail)
                      .collection("investements")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      default:
                        if (snapshot.data!.docs.isEmpty) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(
                                const Investment(),
                              );
                            },
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyText(
                                    data: 'You dont have investments',
                                    fontsize: 20,
                                    width: context.screenWidth - 50,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  MyText(
                                    data: 'Press to invest Now !',
                                    fontsize: 22,
                                    width: context.screenWidth - 120,
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final Map<String, dynamic> data =
                                  snapshot.data!.docs[index].data();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: context.screenHeight * 60,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            data: 'Amount invetsement',
                                            fontsize: context.screenWidth * 3,
                                            width: context.screenWidth * 35,
                                          ),
                                          SizedBox(
                                            width: context.screenWidth * 2,
                                          ),
                                          MyText(
                                            width: context.screenWidth * 40,
                                            data:
                                                '${data["amount_invetsement"]}',
                                            fontsize: context.screenWidth * 4,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.screenHeight * 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            data: 'Investment return',
                                            fontsize: context.screenWidth * 3,
                                            width: context.screenWidth * 35,
                                          ),
                                          SizedBox(
                                            width: context.screenWidth * 2,
                                          ),
                                          MyText(
                                            data: ' ${data["final_amount"]}',
                                            fontsize: context.screenWidth * 4,
                                            width: context.screenWidth * 40,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.screenHeight * 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            data: 'Investment duration',
                                            fontsize: context.screenWidth * 3,
                                            width: context.screenWidth * 35,
                                          ),
                                          SizedBox(
                                            width: context.screenWidth * 2,
                                          ),
                                          MyText(
                                            data: '${data['duration-name']}',
                                            fontsize: context.screenWidth * 4,
                                            width: context.screenWidth * 40,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.screenHeight * 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            data: 'Accrued interest',
                                            fontsize: context.screenWidth * 3,
                                            width: context.screenWidth * 35,
                                          ),
                                          SizedBox(
                                            width: context.screenWidth * 2,
                                          ),
                                          MyText(
                                            data: '${data["accrued_interest"]}',
                                            fontsize: context.screenWidth * 4,
                                            width: context.screenWidth * 40,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.screenHeight * 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            data: 'Investement type',
                                            fontsize: context.screenWidth * 3,
                                            width: context.screenWidth * 35,
                                          ),
                                          SizedBox(
                                            width: context.screenWidth * 2,
                                          ),
                                          MyText(
                                            data: '${data["investement_type"]}',
                                            fontsize: context.screenWidth * 4,
                                            width: context.screenWidth * 40,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.screenHeight * 1,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          MyText(
                                            data: 'Implementaion_type',
                                            fontsize: context.screenWidth * 3,
                                            width: context.screenWidth * 35,
                                          ),
                                          SizedBox(
                                            width: context.screenWidth * 2,
                                          ),
                                          MyText(
                                            data:
                                                '${data["implementaion_type"]}',
                                            fontsize: context.screenWidth * 4,
                                            width: context.screenWidth * 40,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                    }
                  },
                ),
              ),
            ],
          ),
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
  });
  String data;
  double fontsize;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
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
      ),
    );
  }
}
