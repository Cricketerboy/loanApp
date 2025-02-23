import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/presentation/splash_screen/controller/splash_screen_controller.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_image_view.dart';

/// A Splash Screen widget that displays the app logo.
class SplashScreen extends GetWidget<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.blue900,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 240.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                imagePath: "assets/images/splash_svg.svg",
                height: 140.h,
                width: 200.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
