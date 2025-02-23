import 'package:get/get.dart';

/// A controller class for the AppNavigationScreen.
/// This class manages the state of the AppNavigationScreen,
/// including the current appNavigationModelObj.
class OfferScreenController extends GetxController {
  Rx<OfferScreenModel> appNavigationModelObj = OfferScreenModel().obs;
}

class OfferScreenModel {}
