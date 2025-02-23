import 'package:get/get.dart';

import 'package:loanapp/presentation/offer_screen/controller/offer_screen_controller.dart';

class OfferScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OfferScreenController());
  }
}
