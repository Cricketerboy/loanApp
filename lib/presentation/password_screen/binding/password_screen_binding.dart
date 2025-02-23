import 'package:get/get.dart';
import 'package:loanapp/presentation/password_screen/controller/password_screen_controller.dart';

class PasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordController());
  }
}
