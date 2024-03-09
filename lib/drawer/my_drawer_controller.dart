import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../analyze/analyze_individual_view.dart';
import '../auth/user_data_controller.dart';
import '../automated_annual_,accured/anuual_accrued_view.dart';
import '../automated_day_,month/daily_montly_view_interest.dart';
import '../costs/cost_view.dart';
import '../identifying/identifying.dart';
import '../investement/reinvestment.dart';
import '../pay_late/paylate.dart';
import '../profile/customer_analysis.dart';
import '../profitability/profitability.dart';
import '../risk/risk_management.dart';
import '../screens/intrest.dart';
import '../starting_screens/second.dart';
import '../track_interest/trake_interst.dart';
import '../withdrawal/withdrawal.dart';

UserDataController userData = UserDataController();

class MyDrawerController {
  var name = '';

  Future<void> getCurrentUserName() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser!.email)
            .get();
    name = userSnapshot.data()?['name'];
  }

  void goToInterest() {
    Get.to(
      const Intrest(),
    );
  }

  void goToCustomerAnalysis() {
    Get.to(
      const CustomerAnalysis(),
    );
  }

  void goToPaylate() {
    Get.to(
      const Paylate(),
    );
  }

  void goToAnalyzeIndividual() {
    Get.to(
      const AnalyzeIndividual(),
    );
  }

  void goToSecondScreen() {
    Get.to(
      const Second(),
    );
  }

  void goTotoSupport() {
    Get.to(
      const Reinvestment(),
    );
  }

  void goToTrakeInterst() {
    Get.to(
      const TrackInterst(),
    );
  }

  void goToIdentifying() {
    Get.to(
      const Identifying(),
    );
  }

  void goToProfitabilityReports() {
    Get.to(
      const ProfitabilityReports(),
    );
  }

  void goTodailyAndMonthlyinterest() {
    Get.to(
      const dailyMonthlyinterestView(),
    );
  }

  void goToAnnualAndAccruedInterest() {
    Get.to(
      const AnnualAndAccruedInterest(),
    );
  }

  void goToProfitability() {
    Get.to(
      const ProfitabilityReports(),
    );
  }

  void goToRiskMAanagement() {
    Get.to(
      const RiskManagement(),
    );
  }

  void goToDevelopmentSchedule() {
    Get.to(
      const DevelopmentSchedule(),
    );
  }

  void goToWithdrawal() {
    Get.to(
      const Withdrawal(),
    );
  }
}
