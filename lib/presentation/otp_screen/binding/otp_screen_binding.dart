import 'package:get/get.dart';

import 'package:loanapp/presentation/otp_screen/controller/otp_screen_controller.dart';

class OtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpScreenController());
  }
}
