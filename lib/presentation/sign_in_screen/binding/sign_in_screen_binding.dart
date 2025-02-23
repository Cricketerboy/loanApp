import 'package:get/get.dart';
import 'package:loanapp/presentation/sign_in_screen/controller/sign_in_screen_controller.dart';

class SignInScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInScreenController());
  }
}
