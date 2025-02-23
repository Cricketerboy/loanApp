import 'package:get/get.dart';
import 'package:loanapp/presentation/app_navigation_screen/controller/app_navigation_controller.dart';

/// A binding class for the AppNavigationScreen.
/// Ensures that the AppNavigationController is initialized
/// when the AppNavigationScreen is first loaded.
class AppNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppNavigationController());
  }
}
