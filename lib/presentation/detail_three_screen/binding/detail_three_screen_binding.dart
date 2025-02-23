import 'package:get/get.dart';
import 'package:loanapp/presentation/detail_three_screen/controller/detail_three_screen_controller.dart';

class DetailThreeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsThreeController());
  }
}
