import 'package:get/get.dart';
import 'package:loanapp/presentation/application_status_one_screen/controller/application_status_one_screen_controller.dart';

class ApplicationStatusOneScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationStatusOneController());
  }
}
