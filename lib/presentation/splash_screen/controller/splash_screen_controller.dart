import 'package:get/get.dart';
import 'package:loanapp/routes/app_routes.dart';

/// A controller class for the AppNavigationScreen.
/// This class manages the state of the AppNavigationScreen,
/// including the current appNavigationModelObj.
class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // Navigate to Create Account screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.createAnAccountScreen);
    });
  }
}

class SplashScreenModel {}
