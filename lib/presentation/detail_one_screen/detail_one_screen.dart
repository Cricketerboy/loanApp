import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/presentation/detail_one_screen/controller/detail_one_screen_controller.dart';
import 'package:loanapp/routes/app_routes.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_drop_down.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';
import 'package:loanapp/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

class DetailsOneScreen extends GetWidget<DetailsOneController> {
  DetailsOneScreen({Key? key}) : super(key: key);

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
                      _buildHeaderRow(),
                      SizedBox(height: 22.h),
                      _buildPersonalDetailsForm(),
                      SizedBox(height: 80.v),
                      _buildContinueButton(),
                      SizedBox(height: 34.h),
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

  /// Header Row Widget
  Widget _buildHeaderRow() {
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
              "Personal Details".tr,
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// First Name Input
  Widget _buildFirstNameInput() {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: CustomTextFormField(
        controller: controller.firstNameInputController,
        hintText: "Your first name".tr,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Mandatory".tr;
          }
          return null;
        },
      ),
    );
  }

  /// Last Name Input
  Widget _buildLastNameInput() {
    return CustomTextFormField(
      controller: controller.lastNameInputController,
      hintText: "Your last name".tr,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Mandatory".tr;
        }
        return null;
      },
    );
  }

  /// Date of Birth Input
  Widget _buildDateOfBirthInput() {
    return Padding(
      padding: EdgeInsets.only(left: 4.h),
      child: CustomTextFormField(
        readOnly: true,
        controller: controller.dateOfBirthInputController,
        hintText: "DD-MM-YYYY".tr,
        textInputAction: TextInputAction.done,
        suffix: Container(
          margin: EdgeInsets.fromLTRB(16.h, 12.h, 14.h, 12.h),
          child: Icon(
            Icons.calendar_month,
          ),
        ),
        suffixConstraints: BoxConstraints(maxHeight: 48.h),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.h),
        onTap: () => _onTapDateOfBirthInput(),
      ),
    );
  }

  /// Personal Details Form
  Widget _buildPersonalDetailsForm() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Name & Last Name in Row
          Row(
            children: [
              // First Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("First Name*".tr, style: theme.textTheme.titleSmall),
                    SizedBox(height: 12.h),
                    _buildFirstNameInput(),
                  ],
                ),
              ),
              SizedBox(width: 12.h), // Space between fields
              // Last Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Last Name*".tr, style: theme.textTheme.titleSmall),
                    SizedBox(height: 12.h),
                    _buildLastNameInput(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),

          // Gender Selection
          Text("Gender*".tr, style: theme.textTheme.titleSmall),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: CustomDropDown(
              icon: Container(
                margin: EdgeInsets.only(left: 16.h),
                child: Icon(
                  Icons.keyboard_arrow_down,
                ),
              ),
              iconSize: 24.h,
              hintText: "Select your gender".tr,
              items:
                  controller.detailsOneModelObj.value.dropdownItemList!.value,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.h),
            ),
          ),
          SizedBox(height: 24.h),

          // Date of Birth
          Text("Date of Birth*".tr, style: theme.textTheme.titleSmall),
          SizedBox(height: 12.h),
          _buildDateOfBirthInput(),
          SizedBox(height: 24.h),

          // Marital Status
          Text("Your Marital Status*".tr, style: theme.textTheme.titleSmall),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.only(left: 4.h),
            child: CustomDropDown(
              icon: Container(
                margin: EdgeInsets.only(left: 16.h),
                child: Icon(
                  Icons.arrow_drop_down,
                ),
              ),
              iconSize: 24.h,
              hintText: "Select".tr,
              items:
                  controller.detailsOneModelObj.value.dropdownItemList1!.value,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.h),
            ),
          ),
        ],
      ),
    );
  }

  /// Continue Button
  Widget _buildContinueButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: CustomElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.saveBasicDetails();
          }
        },
        text: "Continue".tr,
      ),
    );
  }

  /// Date Picker Function
  Future<void> _onTapDateOfBirthInput() async {
    DateTime? dateTime = await showDatePicker(
      context: Get.context!,
      initialDate:
          controller.detailsOneModelObj.value.selectedDateOfBirthInput!.value ??
              DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.lightBlue, // Header background color

            colorScheme: ColorScheme.light(
                primary: Colors.lightBlue), // Selected date background
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (dateTime != null) {
      controller.detailsOneModelObj.value.selectedDateOfBirthInput!.value =
          dateTime;
      controller.dateOfBirthInputController.text =
          DateFormat('dd-MM-yyyy').format(dateTime);
    }
  }
}
