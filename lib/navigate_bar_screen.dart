// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'analyze/analyze_individual_view.dart';
import 'auth/user_data_controller.dart';
import 'automated_annual_,accured/accrued_interest_history.dart';
import 'automated_annual_,accured/annual_interest_history.dart';
import 'automated_annual_,accured/anuual_accrued_view.dart';
import 'automated_day_,month/daily_history.dart';
import 'automated_day_,month/monthly_history.dart';
import 'client_information/client_info.dart';
import 'costs/cost_view.dart';
import 'profile/user_info.dart';
import 'profitability/loan_history.dart';
import 'profitability/net_income_history.dart';
import 'risk/risk_management.dart';
import 'screens/intrest.dart';
import 'investement/investement_type.dart';
import 'investement/investment.dart';
import 'investement/reinvestment.dart';
import 'automated_day_,month/daily_montly_view_interest.dart';
import 'profile/customer_analysis.dart';
import 'profile/profile_info.dart';
import 'temporary/test.dart';
import 'investement/my_investments.dart';
import 'pay_late/paylate.dart';
import 'profitability/profitability.dart';
import 'screens/dashboard.dart';
import 'temporary/test_three.dart';
import 'withdrawal/withdrawal.dart';
import 'main_screens/home.dart';
import 'investement/infestement_calculate.dart';
import 'identifying/identifying.dart';
import 'screens/report.dart';
import 'track_interest/trake_interst.dart';
import 'temporary/editable.dart';
import 'products/products_view.dart';

class NavigateBarScreen extends StatefulWidget {
  const NavigateBarScreen({super.key});
  @override
  State<NavigateBarScreen> createState() => _HomePageState();
}

class _HomePageState extends State<NavigateBarScreen> {
  final List<Widget> _pages = [
    const MyInvestments(),
    const ProductsHome(),
    const Home(),
    const CalculateInvestement(),
  ];
  int _currentIndex = 2;
  double sizeIcon = 25;
  double sizeFont = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.amber,
      body: SizedBox(child: _pages[_currentIndex]),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white30,
        onTap: (int index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        items: [
          SalomonBottomBarItem(
            selectedColor: const Color.fromARGB(255, 42, 38, 2),
            unselectedColor: Colors.grey,
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black],
                ).createShader(bounds);
              },
              child: Icon(
                Icons.monetization_on_outlined,
                size: sizeIcon,
                color: Colors.white,
              ),
            ),
            title: Text(
              "My Investments",
              style: TextStyle(fontSize: sizeFont),
            ),
          ),
          SalomonBottomBarItem(
            selectedColor: const Color.fromARGB(255, 42, 38, 2),
            unselectedColor: Colors.grey,
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black],
                ).createShader(bounds);
              },
              child: Icon(
                FontAwesomeIcons.gem,
                size: sizeIcon,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Jewelry",
              style: TextStyle(fontSize: sizeFont),
            ),
          ),
          SalomonBottomBarItem(
            selectedColor: const Color.fromARGB(255, 99, 92, 25),
            unselectedColor: Colors.grey,
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Colors.black,
                  ],
                ).createShader(bounds);
              },
              child: Icon(
                Icons.home,
                size: sizeIcon,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Home",
              style: TextStyle(fontSize: sizeFont),
            ),
          ),
          SalomonBottomBarItem(
            selectedColor: const Color.fromARGB(255, 42, 38, 2),
            unselectedColor: Colors.grey,
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black],
                ).createShader(bounds);
              },
              child: Icon(
                Icons.monitor_heart_sharp,
                size: sizeIcon,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Invest now",
              style: TextStyle(fontSize: sizeFont),
            ),
          ),
        ],
      ),
    );
  }
}
