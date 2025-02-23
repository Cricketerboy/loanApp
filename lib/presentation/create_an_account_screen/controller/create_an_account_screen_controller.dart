import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loanapp/routes/app_routes.dart';

class CreateAnAccountScreenController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  Rx<CreateAnAccountModel> createAnAcountModelObj = CreateAnAccountModel().obs;
  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('91').obs;
  Rx<bool> checkboxFillIwg = false.obs;

  /// ✅ **Function to Request OTP**
  Future<void> requestOtp() async {
    String phone =
        "+${selectedCountry.value.phoneCode}${phoneNumberController.text.trim()}";

    if (phoneNumberController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your phone number.");
      return;
    }

    try {
      var url = Uri.parse(
          "https://loanapp-backend-xnak.onrender.com/api/auth/request-otp");
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": phone}),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "OTP sent successfully.");
        Get.toNamed(AppRoutes.otpScreen,
            arguments: {"phone": phone}); // Navigate to OTP screen
      } else {
        var errorMessage =
            jsonDecode(response.body)['message'] ?? 'Failed to send OTP';
        Get.snackbar("Error", errorMessage);
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.");
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    super.onClose();
  }
}

class CreateAnAccountModel {}
