import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bank/helpers/media_query.dart';

import '../auth/change_pass.dart';
import '../auth/user_data_controller.dart';
import '../profile/user_info.dart';
import '../starting_screens/second.dart';
import '../starting_screens/termsandconditions.dart';
import 'my_drawer_controller.dart';

MyDrawerController myDrawerController = MyDrawerController();
UserDataController userDataController = UserDataController();

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: context.screenWidth * 100,
        height: context.screenHeight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const DrawerHeader(
                    child: Icon(
                      CupertinoIcons.person,
                      color: Colors.black,
                      size: 85,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: PopupMenuButton<String>(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 35,
                      ),
                      onSelected: (String value) {
                        if (value == 'Option 1') {
                          Get.to(const Second());
                        } else if (value == 'Option 2') {
                          Get.to(
                            const TermsAndConditions(),
                          );
                        } else if (value == 'Option 3') {
                          Get.to(
                            const ChangePass(),
                          );
                        } else if (value == 'Option 4') {
                          Get.to(
                            const UserInfo(),
                          );
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'Option 1',
                            child: Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 2',
                            child: Text(
                              'Terms and conditions',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 3',
                            child: Text(
                              'Change password',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const PopupMenuItem<String>(
                            value: 'Option 4',
                            child: Text(
                              'Client information',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ];
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // Text(
                  //   userDataController.currentUserEmail ?? "NotSigned",
                  //   style: const TextStyle(color: Colors.black),
                  // ),
                  MyListTile(
                    text: "My interest",
                    onTap: myDrawerController.goToInterest,
                  ),
                  MyListTile(
                    text: "late payments",
                    onTap: myDrawerController.goToPaylate,
                  ),
                  MyListTile(
                    text: "analyze individual",
                    onTap: myDrawerController.goToAnalyzeIndividual,
                  ),
                  MyListTile(
                    text: "Track interest",
                    onTap: myDrawerController.goToTrakeInterst,
                  ),
                  MyListTile(
                    text: "Identifying",
                    onTap: myDrawerController.goToIdentifying,
                  ),
                  MyListTile(
                    text: "Analysis",
                    onTap: myDrawerController.goToCustomerAnalysis,
                  ),
                  MyListTile(
                    text: "Profit ability Reports",
                    onTap: myDrawerController.goToProfitabilityReports,
                  ),
                  MyListTile(
                    text: "Daily&Monthly interest",
                    onTap: myDrawerController.goTodailyAndMonthlyinterest,
                  ),
                  MyListTile(
                    text: "Annual&And Accrued Interest",
                    onTap: myDrawerController.goToAnnualAndAccruedInterest,
                  ),
                  MyListTile(
                    text: "Withdrawal",
                    onTap: myDrawerController.goToWithdrawal,
                  ),
                  MyListTile(
                    text: "Risk",
                    onTap: myDrawerController.goToRiskMAanagement,
                  ),
                  MyListTile(
                    text: "Development Schedule",
                    onTap: myDrawerController.goToDevelopmentSchedule,
                  ),
                  MyListTile(
                    text: "Support",
                    onTap: myDrawerController.goTotoSupport,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.logout,
                        size: 50,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: GestureDetector(
                          onTap: userData.signOut,
                          child: Text(
                            "L O G O U T",
                            style: TextStyle(
                              color: Colors.amber.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  IconData? icon;
  final String text;
  final void Function()? onTap;

  MyListTile({super.key, this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              letterSpacing: 2,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: onTap,
        ),
        const Divider(
          color: Colors.grey, // لون الخط يمكن تعديله حسب التصميم المطلوب
          thickness: 1, // سمك الخط
        ),
      ],
    );
  }
}
