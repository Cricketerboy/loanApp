import 'package:flutter/material.dart';
import 'package:loanapp/core/utils/size_utils';

class CustomCheckboxButton extends StatelessWidget {
  const CustomCheckboxButton({
    Key? key,
    required this.onChange,
    this.decoration,
    this.alignment,
    this.isRightCheck,
    this.iconSize,
    this.value,
    this.text,
    this.width,
    this.padding,
    this.textStyle,
    this.overflow,
    this.textAlignment,
    this.isExpandedText = false,
  }) : super(key: key);

  final BoxDecoration? decoration;
  final Alignment? alignment;
  final bool? isRightCheck;
  final double? iconSize;
  final bool? value;
  final Function(bool) onChange;
  final String? text;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final TextOverflow? overflow;
  final TextAlign? textAlignment;
  final bool isExpandedText;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildCheckBoxWidget(),
          )
        : _buildCheckBoxWidget();
  }

  Widget _buildCheckBoxWidget() {
    return GestureDetector(
      onTap: () => onChange(!(value ?? false)),
      child: Container(
        decoration: decoration,
        width: width,
        padding: padding,
        child: (isRightCheck ?? false)
            ? _rightSideCheckbox()
            : _leftSideCheckbox(),
      ),
    );
  }

  Widget _leftSideCheckbox() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.translate(
          offset: Offset(0, -4), // Moves the checkbox slightly upward
          child: _checkboxWidget(),
        ),
        SizedBox(width: text != null && text!.isNotEmpty ? 8 : 0),
        isExpandedText ? Expanded(child: _textWidget()) : _textWidget(),
      ],
    );
  }

  Widget _rightSideCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isExpandedText ? Expanded(child: _textWidget()) : _textWidget(),
        SizedBox(width: text != null && text!.isNotEmpty ? 8 : 0),
        Transform.translate(
          offset: Offset(0, -4), // Moves the checkbox slightly upward
          child: _checkboxWidget(),
        ),
      ],
    );
  }

  Widget _textWidget() {
    return Text(
      text ?? "",
      textAlign: textAlignment ?? TextAlign.start,
      overflow: overflow,
      style: textStyle ??
          TextStyle(
            color: Colors.grey.shade700,
            fontSize: 13.v,
          ), // Replace with your theme
    );
  }

  Widget _checkboxWidget() {
    return SizedBox(
      height: iconSize ?? 24.0,
      width: iconSize ?? 24.0,
      child: Checkbox(
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        value: value ?? false,
        checkColor: Colors.white, // Replace with your theme
        activeColor: Colors.green.shade700, // Replace with your theme
        side:
            BorderSide(color: Colors.grey.shade300), // Replace with your theme
        onChanged: (newValue) => onChange(newValue!),
      ),
    );
  }
}
