import 'package:get/get.dart';

/// A controller class for the AppNavigationScreen.
/// This class manages the state of the AppNavigationScreen,
/// including the current appNavigationModelObj.
class AppNavigationController extends GetxController {
  Rx<AppNavigationModel> appNavigationModelObj = AppNavigationModel().obs;
}

class AppNavigationModel {}
