import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/presentation/loan_calculator_screen/controller/loan_calculator_screen_controller.dart';
import 'package:loanapp/routes/app_routes.dart';
import 'package:loanapp/theme/custom_button_style.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_drop_down.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';
import 'package:loanapp/widgets/custom_image_view.dart';

import '../../theme/custom_text_style.dart';

class LoanCalculatorScreen extends GetWidget<LoanCalculatorController> {
  LoanCalculatorScreen({Key? key}) : super(key: key);

  final LoanCalculatorController controller =
      Get.put(LoanCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 23.h),
              _buildHeaderSection(),
              SizedBox(height: 18.v),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 15.h),
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
                    _buildLoanApplicationSection(),
                    _buildInfoText(
                        "We’ve calculated your loan eligibility. Select your preferred loan amount and tenure."
                            .tr),
                    SizedBox(height: 20.v),
                    _buildInterestAndFeesSection(),
                    SizedBox(height: 15.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13.h),
                      child: Divider(
                          color: const Color.fromARGB(255, 221, 218, 218),
                          thickness: 1),
                    ),
                    SizedBox(height: 18.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: _buildLoanPurposeSection(),
                    ),
                    SizedBox(height: 18.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: _buildLoanDetailsSection(),
                    ),
                    SizedBox(height: 26.v),
                    _buildSummarySection(),
                    SizedBox(height: 26.v),
                    _buildInfoText(
                        "Thank you for choosing CreditSea. Please accept to proceed with the loan details."
                            .tr),
                    SizedBox(height: 26.v),
                    _buildApplyButton(),
                    SizedBox(height: 14.v),
                    _buildCancelButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 84.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: "assets/images/Final SVGs-02 1.svg",
            height: 40.v,
            width: 60.h,
          ),
        ],
      ),
    );
  }

  Widget _buildLoanApplicationSection() {
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
              "Apply for loan".tr,
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestAndFeesSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Row(
        children: [
          _buildDottedContainer("Interest Per Day 1%".tr),
          SizedBox(width: 8),
          _buildDottedContainer("Processing Fee 10%".tr),
        ],
      ),
    );
  }

  Widget _buildDottedContainer(String text) {
    return Expanded(
      // Now correctly used inside a Row
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: DottedBorder(
          color: appTheme.blueA200,
          strokeWidth: 1,
          dashPattern: [5, 2],
          child: Container(
            width: double.infinity, // Ensures it takes full space
            padding: EdgeInsets.symmetric(vertical: 6.v, horizontal: 13.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text,
                    style: CustomTextStyles.titleSmallMedium
                        .copyWith(fontSize: 11.h))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoanPurposeSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Purpose of Loan*".tr, style: Get.textTheme.titleSmall),
          SizedBox(height: 12),
          CustomDropDown(
            icon: Icon(Icons.keyboard_arrow_down),
            hintText: "Select purpose of loan".tr,
            items:
                controller.loanCalculatorModelObj.value.dropdownItemList!.value,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildLoanDetailsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          _buildDetailRow("Principal Amount".tr, _buildPrincipalAmountButton()),
          _buildSlider(controller.loanAmount, 1000, 100000),
          _buildDetailRow("Tenure".tr, _buildTenureButton()),
          _buildSlider(controller.interestRate, 20, 40),
          Padding(
            padding: EdgeInsets.only(left: 4.h, right: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("20 Days".tr, style: Get.textTheme.labelMedium),
                Text("45 Days".tr, style: Get.textTheme.labelMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, Widget widget) {
    return Padding(
      padding: EdgeInsets.only(left: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Get.textTheme.titleSmall),
          widget,
        ],
      ),
    );
  }

  Widget _buildPrincipalAmountButton() {
    return Obx(() => CustomElevatedButton(
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: const Color.fromARGB(255, 221, 218, 218)),
            ),
          ),
          height: 30,
          width: 100,
          text: "₹ ${controller.loanAmount.value}".tr, // Dynamic value
          buttonTextStyle: CustomTextStyles.titleSmallMedium,
        ));
  }

  Widget _buildTenureButton() {
    return Obx(() => CustomElevatedButton(
          buttonStyle: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: const Color.fromARGB(255, 221, 218, 218)),
            ),
          ),
          height: 30,
          width: 100,
          text: "${controller.interestRate.value} Days".tr, // Dynamic value
          buttonTextStyle: CustomTextStyles.titleSmallMedium,
        ));
  }

  Widget _buildSlider(RxInt sliderValue, int min, int max) {
    return Obx(() => Column(
          children: [
            Slider(
              value: sliderValue.value.toDouble(), // ✅ Convert to double
              min: min.toDouble(),
              max: max.toDouble(),
              onChanged: (value) {
                sliderValue.value = value.toInt(); // ✅ Convert back to int
              },
            ), // ✅ Display as int
          ],
        ));
  }

  Widget _buildSummarySection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13.h),
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.h),
        border: Border.all(
          color: appTheme.blueA200,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          _buildTotalPayableRow(
              "Principal Amount".tr, _buildPrincipalAmountText()),
          SizedBox(height: 10.v),
          _buildTotalPayableRow(
              "Interest".tr,
              Text("1%".tr,
                  style: CustomTextStyles.titleMediumLightBlueA700.copyWith(
                      color: appTheme.lightBlueA700))), // Fixed Interest
          SizedBox(height: 10.v),
          _buildTotalPayableRow("Total Payable".tr,
              _buildTotalPayableValue()), // Dynamically calculated
        ],
      ),
    );
  }

  Widget _buildPrincipalAmountText() {
    return Obx(() => Text("₹${controller.loanAmount.value}".tr,
        style: CustomTextStyles.titleMediumLightBlueA700
            .copyWith(color: appTheme.lightBlueA700)));
  }

  Widget _buildTotalPayableRow(String label, Widget valueWidget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: CustomTextStyles.titleMediumGray800
                .copyWith(color: appTheme.gray800)),
        valueWidget, // Now accepting a Widget instead of String
      ],
    );
  }

  Widget _buildTotalPayableValue() {
    return Obx(() {
      double principal = controller.loanAmount.value.toDouble();
      double totalPayable = principal + (principal * 0.01); // 1% Fixed Interest

      return Text("₹${totalPayable.toStringAsFixed(2)}".tr,
          style: CustomTextStyles.titleMediumLightBlueA700
              .copyWith(color: appTheme.lightBlueA700));
    });
  }

  Widget _buildApplyButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.h),
      child: CustomElevatedButton(
        text: "Apply".tr,
        margin: EdgeInsets.symmetric(horizontal: 8),
        onPressed: () {
          Get.toNamed(AppRoutes.offerScreen);
        },
      ),
    );
  }

  Widget _buildCancelButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.h),
      child: CustomElevatedButton(
        buttonStyle: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
            side:
                BorderSide(color: appTheme.blueA200, width: 1.5), // Blue border
          ),
        ),
        text: "Cancel".tr,
        margin: EdgeInsets.symmetric(horizontal: 8),
        buttonTextStyle: CustomTextStyles.titleSmallMedium,
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Text(
        text,
        style: CustomTextStyles.titleSmallMedium
            .copyWith(color: appTheme.blueA200),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
