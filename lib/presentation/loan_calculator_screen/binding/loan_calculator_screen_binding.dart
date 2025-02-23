import 'package:get/get.dart';
import 'package:loanapp/presentation/loan_calculator_screen/controller/loan_calculator_screen_controller.dart';

class LoanCalculatorScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoanCalculatorController());
  }
}
