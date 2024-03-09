import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bank/helpers/media_query.dart';

import '../auth/authenticate.dart';
import '../auth/user_data_controller.dart';
import '../drawer/my_drawer.dart';

UserDataController userDataController = UserDataController();

class DevelopmentSchedule extends StatefulWidget {
  const DevelopmentSchedule({Key? key}) : super(key: key);

  @override
  State<DevelopmentSchedule> createState() => _DevelopmentScheduleState();
}

class _DevelopmentScheduleState extends State<DevelopmentSchedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          drawer: const MyDrawer(),
          appBar: AppBar(
            title: Center(
              child: Text(
                'Development schedule',
                style: GoogleFonts.cairo(
                  fontSize: context.screenWidth * 5,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  letterSpacing: 3.0,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.black12,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '   Development Schedule and Cost',
                    style: GoogleFonts.cairo(fontSize: 23, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 210),
                  child: FilledButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddDataDialog();
                        },
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.amber,
                      textStyle: const TextStyle(fontSize: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text(
                      'add',
                      style: GoogleFonts.cairo(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                      top: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                  data: 'chosen job',
                                  fontsize: 12,
                                  color: Colors.amber),
                              SizedBox(width: 4),
                              MyText(
                                  data: 'complexity',
                                  fontsize: 12,
                                  color: Colors.amber),
                              SizedBox(width: 4),
                              MyText(
                                data: 'prefered Development',
                                fontsize: 12,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, right: 5),
                      child: SizedBox(
                        height: 200,
                        child:
                            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .doc(userDataController.currentUserEmail)
                              .collection("schedule_and_cost")
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
                                  return const Text('No data available');
                                } else {
                                  return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      final Map<String, dynamic> data =
                                          snapshot.data!.docs[index].data();
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    MyText(
                                                      data:
                                                          ' ${data["chosen_job"]}',
                                                      fontsize: 15,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    MyText(
                                                      data:
                                                          '${data['prefered_development']}',
                                                      fontsize: 15,
                                                      color: Colors.white,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    MyText(
                                                      data:
                                                          ' ${data["complexity"]}',
                                                      fontsize: 15,
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.data,
    required this.fontsize,
    required this.color,
  }) : super(key: key);

  final String data;
  final double fontsize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: Text(
            data,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class AddDataDialog extends StatefulWidget {
  @override
  _AddDataDialogState createState() => _AddDataDialogState();
}

class _AddDataDialogState extends State<AddDataDialog> {
  final TextEditingController _chosenJobController = TextEditingController();
  final TextEditingController _complexityController = TextEditingController();
  final TextEditingController _preferedDevelopmentController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Data'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _chosenJobController,
            decoration: const InputDecoration(labelText: 'Chosen Job'),
          ),
          TextField(
            controller: _complexityController,
            decoration: const InputDecoration(labelText: 'Complexity'),
          ),
          TextField(
            controller: _preferedDevelopmentController,
            decoration:
                const InputDecoration(labelText: 'Preferred Development'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('users')
                .doc(userDataController.currentUserEmail)
                .collection("schedule_and_cost")
                .add(
              {
                'chosen_job': _chosenJobController.text,
                'complexity': _complexityController.text,
                'prefered_development': _preferedDevelopmentController.text,
              },
            );

            _chosenJobController.clear();
            _complexityController.clear();
            _preferedDevelopmentController.clear();
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
