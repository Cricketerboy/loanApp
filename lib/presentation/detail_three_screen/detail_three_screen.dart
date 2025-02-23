import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/core/utils/validation_functions.dart';
import 'package:loanapp/presentation/detail_three_screen/controller/detail_three_screen_controller.dart';
import 'package:loanapp/routes/app_routes.dart';
import 'package:loanapp/theme/custom_text_style.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';
import 'package:loanapp/widgets/custom_image_view.dart';
import 'package:loanapp/widgets/custom_pin_code_text_field.dart';
import 'package:loanapp/widgets/custom_text_form_field.dart';

class DetailsThreeScreen extends GetWidget<DetailsThreeController> {
  DetailsThreeScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 23.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildProgressItem(1, "Register", true),
                    _buildProgressItem(2, "Offer", false),
                    _buildProgressItem(3, "Approval", false),
                  ],
                ),
                SizedBox(height: 37.v),
                Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.h, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22.h), // Rounded top-left corner
                      topRight:
                          Radius.circular(22.h), // Rounded top-right corner
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Shadow color
                        spreadRadius: 0, // How far the shadow spreads
                        blurRadius: 7, // Blur intensity
                        offset: Offset(
                            0, -5), // Moves shadow **above** the container
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildBackArrowRow(),
                      SizedBox(height: 12.v),
                      CustomImageView(
                        imagePath: "assets/images/post.png",
                        height: 160.h,
                        width: 188.h,
                      ),
                      SizedBox(height: 38.h),
                      _buildEmailVerificationColumn(),
                      SizedBox(height: 80.h),
                      CustomElevatedButton(
                        text: "Verify".tr,
                        margin: EdgeInsets.symmetric(horizontal: 6.h),
                        onPressed: () {
                          Get.offNamed(AppRoutes.loanCalculatorScreen);
                        },
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressItem(int number, String label, bool isActive) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: isActive ? Colors.blue : Colors.grey[300],
          child: Text(number.toString(),
              style:
                  TextStyle(color: isActive ? Colors.white : Colors.grey[600])),
        ),
        SizedBox(width: 6.h),
        Text(label,
            style: TextStyle(
                color: isActive ? Colors.blue : Colors.grey[600],
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  /// **Back Arrow Section**
  Widget _buildBackArrowRow() {
    return Container(
      width: double.maxFinite,
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "Personal Email ID".tr,
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// **Email Verification Section**
  Widget _buildEmailVerificationColumn() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "Email ID*".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: CustomTextFormField(
              controller: controller.emailController,
              hintText: "Enter you email ID".tr,
              textInputType: TextInputType.emailAddress,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
              validator: (value) {
                if (value == null || !isValidEmail(value, isRequired: true)) {
                  return "Mandatory".tr;
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "OTP Verification".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          Container(
            width: 274.h,
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 12.h),
            child: Obx(
              () => CustomPinCodeTextField(
                context: Get.context!,
                controller: controller.otpController.value,
                onChanged: (value) {},
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't receive it?".tr,
                        style: theme.textTheme.labelLarge,
                      ),
                      TextSpan(
                        text: "Resend Code".tr,
                        style: CustomTextStyles.labelLargeLightBlueA700,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "00:28".tr,
                  style: CustomTextStyles.labelLargeBlack900,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
