import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../auth/user_data_controller.dart';
import '../drawer/my_drawer.dart';

class AccruedOpsHistory extends StatefulWidget {
  const AccruedOpsHistory({super.key});

  @override
  State<AccruedOpsHistory> createState() => _AccruedOpsHistoryState();
}

UserDataController userData = UserDataController();

class _AccruedOpsHistoryState extends State<AccruedOpsHistory> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Center(
            child: Text(
              'Accured Operations history',
              style: GoogleFonts.cairo(
                  fontSize: context.screenWidth * 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  letterSpacing: 3.0),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: context.screenWidth * 90,
                  height: 700,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(userData.currentUserEmail)
                        .collection("accrued_ops_history")
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
                              onTap: () {},
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyText(
                                      data: 'You dont have operations',
                                      fontsize: 20,
                                      width: context.screenWidth - 50,
                                      height: context.screenHeight * 5,
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
                                    height: context.screenHeight * 10,
                                    width: context.screenWidth * 90,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MyText(
                                              width: context.screenWidth * 4,
                                              height: context.screenHeight * 6,
                                              data: "(",
                                              fontsize: context.screenWidth * 4,
                                            ),
                                            MyText(
                                              width: context.screenWidth * 12,
                                              height: context.screenHeight * 6,
                                              data: '${data["face_value"]}',
                                              fontsize: context.screenWidth * 3,
                                            ),
                                            MyText(
                                              width: context.screenWidth * 4,
                                              height: context.screenHeight * 6,
                                              data: "*",
                                              fontsize: context.screenWidth * 4,
                                            ),
                                            MyText(
                                              width: context.screenWidth * 12,
                                              height: context.screenHeight * 6,
                                              data: ' ${data["interest_rate"]}',
                                              fontsize: context.screenWidth * 3,
                                            ),
                                            MyText(
                                              data: '*',
                                              fontsize: context.screenWidth * 4,
                                              height: context.screenHeight * 6,
                                              width: context.screenWidth * 4,
                                            ),
                                            MyText(
                                              width: context.screenWidth * 12,
                                              height: context.screenHeight * 6,
                                              data:
                                                  '${data["maturity_period"]}',
                                              fontsize: context.screenWidth * 3,
                                            ),
                                            MyText(
                                              width: context.screenWidth * 10,
                                              height: context.screenHeight * 6,
                                              data: ")/365",
                                              fontsize: context.screenWidth * 3,
                                            ),
                                            MyText(
                                              data: '=',
                                              fontsize: context.screenWidth * 4,
                                              width: context.screenWidth * 4,
                                              height: context.screenHeight * 6,
                                            ),
                                            MyText(
                                              width: context.screenWidth * 15,
                                              height: context.screenHeight * 6,
                                              data:
                                                  '${data['interest_accured_result']}',
                                              fontsize: context.screenWidth * 3,
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
    required this.height,
  });
  String data;
  double fontsize;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
    );
  }
}
