import 'package:get/get.dart';
import 'package:loanapp/presentation/detail_one_screen/controller/detail_one_screen_controller.dart';

class DetailOneScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsOneController());
  }
}
