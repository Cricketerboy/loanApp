import 'package:get/get.dart';
import 'package:loanapp/presentation/detail_four_screen/controller/detail_four_screen_controller.dart';

class DetailFourScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsFourController());
  }
}
