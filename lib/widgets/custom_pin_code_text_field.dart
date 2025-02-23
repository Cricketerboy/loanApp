import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/theme/custom_text_style.dart';
import 'package:loanapp/theme/theme_helper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// A custom pin code text field widget that provides an OTP input field.
///
/// This widget allows users to input a 4-digit OTP using a `PinCodeTextField`.
/// It supports custom styling, validation, and an optional alignment.
class CustomPinCodeTextField extends StatelessWidget {
  /// Creates a [CustomPinCodeTextField] with customizable properties.
  const CustomPinCodeTextField({
    Key? key,
    required this.context,
    required this.onChanged,
    this.alignment,
    this.controller,
    this.textStyle,
    this.hintStyle,
    this.validator,
  }) : super(key: key);

  /// Alignment of the pin code text field.
  final Alignment? alignment;

  /// The build context for the widget.
  final BuildContext context;

  /// Controller for handling the input field.
  final TextEditingController? controller;

  /// Text style for the input field.
  final TextStyle? textStyle;

  /// Hint style for the input field.
  final TextStyle? hintStyle;

  /// Callback function to handle changes in the input field.
  final Function(String) onChanged;

  /// Validator for input validation.
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildPinCodeTextField(),
          )
        : _buildPinCodeTextField();
  }

  /// Builds the pin code text field widget.
  Widget _buildPinCodeTextField() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
      child: PinCodeTextField(
        appContext: context,
        controller: controller,
        length: 6,
        keyboardType: TextInputType.number,
        textStyle: textStyle ?? CustomTextStyles.labelLargeBlack900,
        hintStyle: hintStyle ?? CustomTextStyles.labelLargeBlack900,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        enableActiveFill: true,
        pinTheme: PinTheme(
          fieldHeight: 50.h,
          fieldWidth: 40.h,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(6.h),
          inactiveColor: appTheme.gray400,
          inactiveFillColor: appTheme.whiteA700,
          activeColor: appTheme.gray400,
          activeFillColor: appTheme.whiteA700,
          selectedFillColor: appTheme.whiteA700,
          selectedColor: appTheme.gray400,
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
