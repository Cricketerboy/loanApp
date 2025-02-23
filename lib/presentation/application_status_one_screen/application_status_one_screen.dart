import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/presentation/application_status_one_screen/controller/application_status_one_screen_controller.dart';
import 'package:loanapp/theme/custom_text_style.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';
import 'package:loanapp/widgets/custom_image_view.dart';
import 'package:loanapp/widgets/custom_text_form_field.dart';

class ApplicationStatusOneScreen
    extends GetWidget<ApplicationStatusOneController> {
  const ApplicationStatusOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 23.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProgressItem(1, "Register", false),
                  _buildProgressItem(2, "Offer", false),
                  _buildProgressItem(3, "Approval", true),
                ],
              ),
              SizedBox(height: 37.v),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22.h), // Rounded top-left corner
                    topRight: Radius.circular(22.h), // Rounded top-right corner
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 0, // How far the shadow spreads
                      blurRadius: 7, // Blur intensity
                      offset:
                          Offset(0, -5), // Moves shadow **above** the container
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildApplicationStatusHeader(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: Text(
                          "Loan application no. #CS12323".tr,
                          style: theme.textTheme.titleSmall,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      child: _buildApplicationSteps(),
                    ),
                    SizedBox(height: 32.h),
                    CustomImageView(
                      imagePath: "assets/images/eye.png",
                      height: 90.h,
                      width: 260.h,
                    ),
                    SizedBox(height: 70.h),
                    _buildContinueButton(),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildApplicationStatusHeader() {
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
              "Application Status".tr,
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
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

  Widget _buildApplicationSteps() {
    return Column(
      children: [
        _buildStepWithLine(_buildApplicationSubmitted(), isGreen: true),
        _buildStepWithLine(_buildApplicationUnderReview(), isGreen: false),
        _buildStepWithLine(_buildEKyc(), isGreen: false),
        _buildStepWithLine(_buildENach(), isGreen: false),
        _buildStepWithLine(_buildESign(), isGreen: false),
        _buildStepWithLine(_buildDisbursement(), isGreen: false, isLast: true),
      ],
    );
  }

  Widget _buildStepWithLine(Widget stepWidget,
      {bool isGreen = false, bool isLast = false}) {
    return Column(
      children: [
        stepWidget, // The actual step widget
        if (!isLast) // Add a vertical line if it's not the last step
          Container(
            width: 2, // Line width
            height: 12.v, // Line height (adjust as needed)
            color: isGreen ? Colors.green : Colors.grey[400], // Dynamic color
          ),
      ],
    );
  }

  Widget _buildApplicationSubmitted() {
    return _buildStepField(
      "Application Submitted".tr,
      Icons.task,
      textColor: const Color.fromARGB(255, 5, 133, 9), // Optional
      iconColor: const Color.fromARGB(255, 5, 133, 9), // Optional
      borderColor: const Color.fromARGB(255, 5, 133, 9), // Optional
    );
  }

  Widget _buildApplicationUnderReview() {
    return _buildStepField(
      "Application under Review".tr,
      Icons.article,
      textColor: appTheme.lightBlueA700, // Optional
      iconColor: appTheme.lightBlueA700, // Optional
      borderColor: appTheme.lightBlueA700, // Optional
    );
  }

  Widget _buildEKyc() {
    return _buildStepField(
      "E-KYC".tr,
      Icons.article,
    );
  }

  Widget _buildENach() {
    return _buildStepField(
      "E-Nach".tr,
      Icons.article,
    );
  }

  Widget _buildESign() {
    return _buildStepField(
      "E-Sign".tr,
      Icons.article,
    );
  }

  Widget _buildDisbursement() {
    return _buildStepField(
      "Disbursement".tr,
      Icons.article,
    );
  }

  Widget _buildStepField(
    String hintText,
    IconData icon, {
    Color? textColor, // Optional text color
    Color? iconColor, // Optional icon color
    Color? borderColor, // Optional border color
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.h),
      decoration: BoxDecoration(
        border: Border.all(
            color: borderColor ?? Colors.blueGrey,
            width: 1.5), // Default: blue-grey
        borderRadius: BorderRadius.circular(8.h),
        color: Colors.white, // Background color
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Ensure vertical centering
        children: [
          Icon(
            icon,
            size: 24.h, // Icon size
            color: iconColor ?? Colors.blueGrey, // Default: blue-grey
          ),
          Expanded(
            child: Text(
              hintText,
              style: CustomTextStyles.titleSmallGray600.copyWith(
                color: textColor ?? Colors.black, // Default: black
              ),
              textAlign: TextAlign.center, // Center text within its space
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return CustomElevatedButton(
      text: "Continue".tr,
      margin: EdgeInsets.symmetric(horizontal: 8.h),
    );
  }
}
