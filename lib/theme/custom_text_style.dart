import 'package:flutter/material.dart';
import 'package:loanapp/theme/theme_helper.dart';

/// Extension on [TextStyle] to easily apply the Roboto font family.
extension CustomTextStyleExtension on TextStyle {
  TextStyle get roboto => copyWith(fontFamily: 'Roboto');
}

/// A collection of pre-defined text styles for customizing text appearance.
class CustomTextStyles {
  // White Text Styles
  static TextStyle get whiteA700 =>
      TextStyle(color: appTheme.whiteA700.withOpacity(0.5));
  static TextStyle get whiteA700_1 => TextStyle(color: appTheme.whiteA700);

  // Body Text Styles
  static TextStyle get bodyLargeOnPrimary =>
      theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );

  static TextStyle get bodyLargeRobotoGray800 =>
      theme.textTheme.bodyLarge!.roboto.copyWith(
        color: appTheme.gray800.withOpacity(0.38),
      );

  static TextStyle get bodyMediumGray500 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray500,
      );

  // Label Text Styles
  static TextStyle get labelLargeBlack900 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeGray600 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600.withOpacity(0.9),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeGray700 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray700,
      );

  static TextStyle get labelLargeLightBlueA700 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlueA700,
      );

  static TextStyle get labelLargeLightBlueA700SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlueA700,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargePrimary =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargePrimarySemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeWhiteA700 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.6),
      );

  static TextStyle get labelLargeWhiteA700_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
      );

  // Title Text Styles
  static TextStyle get titleLargeBlack900 =>
      theme.textTheme.titleLarge!.copyWith(
        color: appTheme.black900,
      );

  static TextStyle get titleMediumGray800 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleMediumGray800_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray800,
      );

  static TextStyle get titleMediumLightBlueA700 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.lightBlueA700,
      );

  static get titleMedium_1 => theme.textTheme.titleMedium!;

  static TextStyle get titleSmallBlue900 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue900,
      );

  static TextStyle get titleSmallBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleSmallGray600 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallLightGreenA700 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.lightGreenA700,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallOnPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get titleSmallOnPrimaryMedium =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallRoboto =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallRobotoLightBlueA700 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.lightBlueA700,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallTeal700 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.teal700,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get titleSmallWhiteA700 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );

  static TextStyle get titleSmallWhiteA700_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmall_1 => theme.textTheme.titleSmall!;
}
