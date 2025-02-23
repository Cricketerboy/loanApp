import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:get/get.dart';
import 'package:loanapp/core/utils/size_utils';
import 'package:loanapp/core/utils/validation_functions.dart';
import 'package:loanapp/theme/custom_text_style.dart';
import 'package:loanapp/theme/theme_helper.dart';

// ignore_for_file: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    Key? key,
    required this.country,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  final Country country;
  final Function(Country) onTap;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            _openCountryPicker(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.h),
              border: Border.all(
                  color: appTheme.gray400.withOpacity(0.25), width: 1.h),
              color: appTheme.whiteA700.withOpacity(0.25),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20.h,
                  width: 30.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.h),
                    child: CountryPickerUtils.getDefaultFlagImage(country),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "+${country.phoneCode}",
                    style: CustomTextStyles.bodyLargeOnPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            width: 258.h,
            margin: EdgeInsets.only(left: 14.h),
            child: TextFormField(
              focusNode: FocusNode(),
              autofocus: false,
              controller: controller,
              style: theme.textTheme.bodyLarge!,
              decoration: InputDecoration(
                hintText: "Please enter your mobile no.".tr,
                hintStyle: theme.textTheme.bodyMedium!.copyWith(fontSize: 13.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.h),
                  borderSide: BorderSide(color: appTheme.gray400, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.h),
                  borderSide: BorderSide(color: appTheme.gray400, width: 1),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.h),
                  borderSide: BorderSide(color: appTheme.gray400, width: 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.h),
                  borderSide: BorderSide(color: appTheme.gray400, width: 1),
                ),
                filled: true,
                fillColor: appTheme.whiteA700,
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.h),
              ),
              validator: (value) {
                if (!isValidPhone(value)) {
                  return "err_msg_please_enter_valid_phone_number".tr;
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }

  void _openCountryPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CountryPickerDialog(
        titlePadding: EdgeInsets.all(8.0),
        searchCursorColor: Colors.pinkAccent,
        searchInputDecoration: InputDecoration(hintText: "Search"),
        isSearchable: true,
        title: Text("Select your country"),
        onValuePicked: onTap,
        itemBuilder: (country) => Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country), // Country Flag
            SizedBox(width: 8.0),
            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: country.name, // Country Name
                      style: TextStyle(color: Colors.black87), // Default color
                    ),
                    TextSpan(
                      text: " (+${country.phoneCode})", // Phone Code
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
