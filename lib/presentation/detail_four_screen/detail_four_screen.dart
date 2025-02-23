import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/presentation/detail_four_screen/controller/detail_four_screen_controller.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';
import 'package:loanapp/widgets/custom_image_view.dart';
import 'package:loanapp/widgets/custom_text_form_field.dart';

class DetailsFourScreen extends GetWidget<DetailsFourController> {
  const DetailsFourScreen({Key? key}) : super(key: key);

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
                  _buildProgressItem(1, "Register", true),
                  _buildProgressItem(2, "Offer", false),
                  _buildProgressItem(3, "Approval", false),
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
                    _buildVerifyPanHeader(),
                    SizedBox(height: 8.h),
                    CustomImageView(
                      imagePath: "assets/images/pan.png",
                      height: 160.h,
                      width: 188.h,
                    ),
                    SizedBox(height: 24.h),
                    _buildPanInputSection(),
                    SizedBox(height: 180.h),
                    CustomElevatedButton(
                      text: "Verify".tr,
                      margin: EdgeInsets.symmetric(horizontal: 8.h),
                      onPressed: () {
                        controller.savePan();
                      },
                    ),
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

  /// Section: Verify PAN Header
  Widget _buildVerifyPanHeader() {
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
              "Verify PAN Number*".tr,
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// Section: PAN Input
  Widget _buildPanInputSection() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter Your PAN Number*".tr,
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 12.h),
          CustomTextFormField(
            controller: controller.panController,
            hintText: "e.g,ABCDE1234F".tr,
            textInputAction: TextInputAction.done,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
            borderDecoration: TextFormFieldStyleHelper.outlineGrayTL6,
          ),
        ],
      ),
    );
  }
}
