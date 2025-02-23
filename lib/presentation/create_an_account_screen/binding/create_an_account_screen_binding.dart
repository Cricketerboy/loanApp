import 'package:get/get.dart';
import 'package:loanapp/presentation/create_an_account_screen/controller/create_an_account_screen_controller.dart';

class CreateAnAccountScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateAnAccountScreenController());
  }
}
