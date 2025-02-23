import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/routes/app_routes.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpScreenController extends GetxController with CodeAutoFill {
  RxString phoneNumber = "".obs; // Observable phone number
  Rx<TextEditingController> otpController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    phoneNumber.value = Get.arguments["phone"] ?? "";
    listenForCode();
  }

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  /// **Verify OTP API Call**
  Future<void> verifyOtp() async {
    final String otp = otpController.value.text.trim();
    if (otp.isEmpty) {
      Get.snackbar("Error", "Please enter the OTP",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      var response = await http.post(
        Uri.parse(
            "https://loanapp-backend-xnak.onrender.com/api/auth/verify-otp"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": phoneNumber.value,
          "otp": otp,
        }),
      );

      // print("Response Code: ${response.statusCode}");
      // print("Response Body: ${response.body}");

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("Success", "OTP Verified Successfully!",
            snackPosition: SnackPosition.BOTTOM);
        Get.offNamed(AppRoutes.passwordScreen,
            arguments: {"phone": phoneNumber.value});
      } else {
        Get.snackbar("Error", data["message"] ?? "Invalid OTP",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Something went wrong",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
