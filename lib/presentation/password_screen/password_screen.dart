import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/core/utils/validation_functions.dart';
import 'package:loanapp/presentation/password_screen/controller/password_screen_controller.dart';
import 'package:loanapp/routes/app_routes.dart';
import 'package:loanapp/theme/custom_text_style.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:loanapp/widgets/custom_elevated_button.dart';
import 'package:loanapp/widgets/custom_image_view.dart';
import 'package:loanapp/widgets/custom_text_form_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

/// A screen for password creation.
class PasswordScreen extends GetWidget<PasswordController> {
  PasswordScreen({Key? key}) : super(key: key);

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
                _buildImageGallery(),
                SizedBox(height: 24.h),
                _buildCustomerCareInfo(),
                SizedBox(height: 16.h),
                _buildIndicator(),
                SizedBox(height: 18.h),
                _buildPasswordCreation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the header section with images.
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

  /// Builds the image gallery section.
  Widget _buildImageGallery() {
    return SizedBox(
      width: double.maxFinite,
      child: Center(
        child: CustomImageView(
          imagePath: "assets/images/micro_girl.svg",
          height: 168.v,
          width: 5.h,
        ),
      ),
    );
  }

  /// Builds the customer care information section.
  Widget _buildCustomerCareInfo() {
    return Column(
      children: [
        Text(
          "24x7 Customer Care".tr,
          style: CustomTextStyles.titleMedium_1,
        ),
        SizedBox(height: 6.h),
        Text(
          "Dedicated customer support team".tr,
          style: CustomTextStyles.labelLargeWhiteA700,
        ),
      ],
    );
  }

  /// Builds the page indicator.
  Widget _buildIndicator() {
    return SizedBox(
      height: 8.h,
      child: AnimatedSmoothIndicator(
        activeIndex: 2,
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

  /// Builds the password creation form.
  Widget _buildPasswordCreation() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(13.h, 16.h, 16.h, 22.h),
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
          _buildTitle(),
          SizedBox(height: 12.h),
          _buildPasswordField("Enter password".tr,
              controller.passwordOneController, controller.isShowPassword),
          SizedBox(height: 12.h),
          _buildPasswordField("Re enter password".tr,
              controller.passwordTwoController, controller.isShowPassword1),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.only(right: 6.h),
            child: Text(
              "*your password must include at least 8 characters, inclusive of alt least 1 special character"
                  .tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: CustomTextStyles.bodyMediumGray500.copyWith(height: 1.4),
            ),
          ),
          SizedBox(height: 18.h),
          CustomElevatedButton(
            height: 50.h,
            text: "Proceed".tr,
            buttonTextStyle: theme.textTheme.titleMedium,
            onPressed: () {
              controller.submitPassword(); // Navigate using AppRoutes
            },
          ),
        ],
      ),
    );
  }

  /// Builds the title row with a back button.
  Widget _buildTitle() {
    return Row(
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
          padding: EdgeInsets.only(right: 70.h),
          child: Text(
            "Create a password".tr,
            style: CustomTextStyles.titleLargeBlack900,
          ),
        ),
      ],
    );
  }

  /// Builds a password field with an eye toggle.
  Widget _buildPasswordField(
      String label, TextEditingController controller, RxBool isObscured) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CustomTextStyles.titleSmallOnPrimaryMedium),
        Obx(
          () => CustomTextFormField(
            controller: controller,
            focusNode: FocusNode(), // Ensuring focus works
            hintText: label,
            textInputType: TextInputType.visiblePassword,
            obscureText: isObscured.value,
            readOnly: false, // Ensure it's editable
            suffix: InkWell(
              onTap: () => isObscured.value = !isObscured.value,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.h, 12.h, 14.h, 12.h),
                child: Icon(
                  isObscured.value ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              ),
            ),
            suffixConstraints: BoxConstraints(maxHeight: 50.h),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.h),
            borderDecoration: TextFormFieldStyleHelper.outlineGray,
            fillColor: appTheme.whiteA700,
            validator: (value) {
              if (value == null || !isValidPassword(value, isRequired: true)) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
