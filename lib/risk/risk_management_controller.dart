import 'package:flutter/material.dart';

class RiskManagementController {
  TextEditingController marketRiskController = TextEditingController();
  TextEditingController marketRiskWeightController = TextEditingController();
  TextEditingController creditRiskController = TextEditingController();
  TextEditingController creditRiskWeightController = TextEditingController();
  TextEditingController liquidityRiskController = TextEditingController();
  TextEditingController liquidityRiskWightController = TextEditingController();
////////////////////////////////////////////////////////////
  TextEditingController marketRiskEcoController = TextEditingController();
  TextEditingController marketRiskWeightEcoController = TextEditingController();
  TextEditingController creditRiskEcoController = TextEditingController();
  TextEditingController creditRiskWeightEcoController = TextEditingController();
  TextEditingController liquidityRiskEcoController = TextEditingController();
  TextEditingController liquidityRiskWightEcoController =
      TextEditingController();
  TextEditingController economicGrowthExpectationController =
      TextEditingController();
  TextEditingController economicGrowthExpectationWeightController =
      TextEditingController();
////////////////////////////////////////////////////////////////
  TextEditingController supplyOfMoneyController = TextEditingController();
  TextEditingController demandForMoneyController = TextEditingController();
  double marketRisk = 0;
  double marketRiskWeight = 0;
  double creditRisk = 0;
  double creditRiskWeight = 0;
  double liquidityRisk = 0;
  double liquidityRiskWight = 0;
  double investmentRiskResult = 0;
  /////////////////////////////////////////////////////////////
  double marketRiskEco = 0;
  double marketRiskWeightEco = 0;
  double creditRiskEco = 0;
  double creditRiskWeightEco = 0;
  double liquidityRiskEco = 0;
  double liquidityRiskWightEco = 0;
  double investmentRiskResultEco = 0;
  double economicGrowthExpectation = 0;
  double economicGrowthExpectationWeight = 0;
  double supplyOfMoney = 0;
  double demandForMoney = 0;
  double interestRateResult = 0;
}
