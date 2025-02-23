import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/presentation/otp_screen/controller/otp_screen_controller.dart';
import 'package:loanapp/routes/app_routes.dart';
import 'package:loanapp/theme/custom_text_style.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';
import 'package:loanapp/widgets/custom_image_view.dart';
import 'package:loanapp/widgets/custom_pin_code_text_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OtpScreen extends GetWidget<OtpScreenController> {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.blue900,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(height: 23.h),
                  _buildHeader(),
                  SizedBox(height: 28.v),
                  _buildImageRow(),
                  SizedBox(height: 24.h),
                  Text(
                    "Instant Loan Approval".tr,
                    style: CustomTextStyles.titleMedium_1,
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Users will receive approval within minutes".tr,
                    style: CustomTextStyles.labelLargeWhiteA700,
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 8.h,
                    child: AnimatedSmoothIndicator(
                      activeIndex: 1,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        expansionFactor:
                            2.5, // Controls how much the active dot stretches
                        spacing: 6,
                        activeDotColor: appTheme.whiteA700,
                        dotColor: appTheme.whiteA700.withAlpha(128),
                        dotHeight: 8.h,
                        dotWidth: 8.h, // Default width for inactive dots
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h),
                  _buildOtpVerificationColumn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 84.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            imagePath: "assets/images/creditsea_create.svg",
            height: 60.v,
            width: 60.h,
          ),
        ],
      ),
    );
  }

  Widget _buildImageRow() {
    return SizedBox(
      width: double.maxFinite,
      child: Center(
        child: CustomImageView(
          imagePath: "assets/images/document.svg",
          height: 168.v,
          width: 5.h,
        ),
      ),
    );
  }

  Widget _buildOtpVerificationColumn() {
    return Container(
      width: double.maxFinite,
      height: 400.v,
      padding: EdgeInsets.fromLTRB(14.h, 20.h, 14.h, 34.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.h), // Rounded top-left corner
          topRight: Radius.circular(22.h), // Rounded top-right corner
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue, // Shadow color
            spreadRadius: 0, // How far the shadow spreads
            blurRadius: 1, // Blur intensity
            offset: Offset(0, -5), // Moves shadow **above** the container
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.only(right: 120.h),
                child: Text(
                  "Enter OTP".tr,
                  style: CustomTextStyles.titleLargeBlack900,
                ),
              ),
            ],
          ),
          SizedBox(height: 18.h),
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Verify OTP, Sent on".tr,
                    style: CustomTextStyles.titleSmallOnPrimaryMedium,
                  ),
                  TextSpan(
                    text: controller.phoneNumber.value,
                    style: CustomTextStyles.titleSmallOnPrimary,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 14.h),
            child: Obx(
              () => Expanded(
                child: CustomPinCodeTextField(
                  context: Get.context!,
                  controller: controller.otpController.value,
                  onChanged: (value) {},
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Text(
              "00:28".tr,
              style: CustomTextStyles.labelLargeBlack900,
            ),
          ),
          SizedBox(height: 24.h),
          CustomElevatedButton(
            height: 50.h,
            text: "Verify".tr,
            buttonTextStyle: theme.textTheme.titleMedium,
            onPressed: () {
              controller.verifyOtp(); // Navigate using AppRoutes
            },
          ),
        ],
      ),
    );
  }
}
