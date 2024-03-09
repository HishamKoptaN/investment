import 'package:bank/helpers/media_query.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/my_drawer.dart';
import 'track_interest_controller.dart';

TrackInterestController trackInterestController = TrackInterestController();

class TrackInterst extends StatefulWidget {
  const TrackInterst({Key? key}) : super(key: key);

  @override
  State<TrackInterst> createState() => _TrackInterstState();
}

class _TrackInterstState extends State<TrackInterst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Track interst',
            style: GoogleFonts.cairo(
              fontSize: context.screenWidth * 7,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              letterSpacing: 3.0,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.amber,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Track Interest earnings',
                  style: TextStyle(
                      textBaseline: TextBaseline.alphabetic,
                      fontSize: 30,
                      color: Colors.blue),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Interest value',
                      style: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          fontSize: context.screenWidth * 6,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Interest due date',
                      style: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          fontSize: context.screenWidth * 6,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: context.screenWidth * 90,
                  height: context.screenHeight * 30,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: getUserData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        List<Map<String, dynamic>> userTrackData = snapshot
                            .data!.docs
                            .map((doc) => doc.data() as Map<String, dynamic>)
                            .toList();
                        return ListView.builder(
                          itemCount: userTrackData.length,
                          itemBuilder: (context, index) {
                            Timestamp timestamp =
                                userTrackData[index]['due_date'];
                            DateTime date = timestamp.toDate();
                            String dateString =
                                '${date.year}-${date.month}-${date.day}';
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${userTrackData[index]['interest_value']}',
                                        style: const TextStyle(
                                          textBaseline: TextBaseline.alphabetic,
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 120,
                                      ),
                                      Text(
                                        dateString,
                                        style: const TextStyle(
                                          textBaseline: TextBaseline.alphabetic,
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 3,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        // إعادة عرض الرسالة في حالة حدوث خطأ
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // عرض رمز التحميل أو أي رمز آخر لإظهار التحميل
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Stream<QuerySnapshot> getUserData() async* {
  String? currentUserId = FirebaseAuth.instance.currentUser?.email;
  yield* FirebaseFirestore.instance
      .collection('users')
      .doc(currentUserId)
      .collection('track_interest_earning')
      .snapshots();
}
