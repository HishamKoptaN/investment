import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalyzeController extends GetxController {
  final AnalyzeController controller = Get.put(AnalyzeController());
  TextEditingController the_date_of_purches_controller =
      TextEditingController();
  TextEditingController purchasing_price_controller = TextEditingController();
  TextEditingController number_of_investment_controller =
      TextEditingController();
  TextEditingController sale_date_controller = TextEditingController();
  TextEditingController selling_price_controller = TextEditingController();
  TextEditingController number_of_investments_controller =
      TextEditingController();

  RxString finalresult = ''.obs;
  TextEditingController result_controller = TextEditingController();

  void calculate() {
    double salesPrice = double.tryParse(selling_price_controller.text) ?? 0.0;
    double purchesPrice =
        double.tryParse(purchasing_price_controller.text) ?? 0.0;
    double result = (salesPrice - purchesPrice) / purchesPrice;
    finalresult.value = result.toStringAsFixed(2);
    update();
  }
}
