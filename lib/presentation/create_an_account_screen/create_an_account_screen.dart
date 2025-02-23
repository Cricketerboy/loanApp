import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/presentation/create_an_account_screen/controller/create_an_account_screen_controller.dart';
import 'package:loanapp/routes/app_routes.dart';
import 'package:loanapp/theme/custom_text_style.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_checkbox_button.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';
import 'package:loanapp/widgets/custom_image_view.dart';
import 'package:loanapp/widgets/custom_phone_number.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:country_pickers/country.dart';

class CreateAnAccountScreen extends GetWidget<CreateAnAccountScreenController> {
  CreateAnAccountScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.blue900,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 23.h),
                _buildHeader(),
                SizedBox(height: 28.v),
                _buildHorizontalScrollSection(),
                SizedBox(height: 24.h),
                Text(
                  "Flexible Loan Options".tr,
                  style: CustomTextStyles.titleMedium_1,
                ),
                SizedBox(height: 6.h),
                Text(
                  "Loan types to cater to different financial needs".tr,
                  style: CustomTextStyles.labelLargeWhiteA700,
                ),
                SizedBox(height: 16.h),
                _buildIndicator(),
                SizedBox(height: 18.h),
                _buildWelcomeSection(),
              ],
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

  Widget _buildHorizontalScrollSection() {
    return Center(
      // Ensures the whole section is centered
      child: Padding(
        padding:
            EdgeInsets.only(left: 0.h), // No extra left padding for centering
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center first row images
              children: [
                _buildImageItem("assets/images/car.svg"),
                SizedBox(width: 10.h), // Space between images
                _buildImageItem("assets/images/bike.svg"),
              ],
            ),
            SizedBox(height: 10.h), // Space between rows
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center second row images
              children: [
                _buildImageItem("assets/images/computer.svg"),
                SizedBox(width: 10.h), // Space between images
                _buildImageItem("assets/images/mobile.svg"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageItem(String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.h),
      child: CustomImageView(
        imagePath: imagePath,
        height: 70.h,
        width: 80.h,
        radius: BorderRadius.circular(12.h),
      ),
    );
  }

  Widget _buildIndicator() {
    return SizedBox(
      height: 8.h,
      child: AnimatedSmoothIndicator(
        activeIndex: 0,
        count: 3,
        effect: ExpandingDotsEffect(
          expansionFactor: 2.5, // Controls how much the active dot stretches
          spacing: 6,
          activeDotColor: appTheme.whiteA700,
          dotColor: appTheme.whiteA700.withAlpha(128),
          dotHeight: 8.h,
          dotWidth: 8.h, // Default width for inactive dots
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(16.h, 26.h, 16.h, 32.h),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to Credit Sea!".tr,
            style: CustomTextStyles.titleLargeBlack900,
          ),
          SizedBox(height: 22.h),
          _buildPhoneNumberField(),
          SizedBox(height: 20.h),
          _buildTermsAndConditions(),
          SizedBox(height: 16.h),
          CustomElevatedButton(
            height: 50.h,
            text: "Request OTP".tr,
            buttonTextStyle: theme.textTheme.titleMedium!,
            onPressed: () {
              controller.requestOtp(); // Navigate using AppRoutes
            },
          ),
          SizedBox(height: 40.h),
          InkWell(
            onTap: () {
              Get.offNamed(AppRoutes.signInScreen);
            },
            child: Text(
              "Existing User? Sign in".tr,
              style: CustomTextStyles.titleSmallBlue900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mobile Number".tr,
            style: CustomTextStyles.titleSmallOnPrimaryMedium,
          ),
          SizedBox(height: 6.h),
          Obx(
            () => CustomPhoneNumber(
              country: controller.selectedCountry.value,
              controller: controller.phoneNumberController,
              onTap: (Country value) {
                controller.selectedCountry.value = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsAndConditions() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Obx(
        () => CustomCheckboxButton(
          alignment: Alignment.centerLeft,
          text:
              "By continuing, you agree to our privacy policies  and Terms & Conditions. "
                  .tr,
          isExpandedText: true,
          value: controller.checkboxFillIwg.value,
          onChange: (value) {
            controller.checkboxFillIwg.value = value;
          },
        ),
      ),
    );
  }
}
