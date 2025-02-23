import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loanapp/routes/app_routes.dart';

class PasswordController extends GetxController {
  TextEditingController passwordOneController = TextEditingController();
  TextEditingController passwordTwoController = TextEditingController();

  RxBool isShowPassword = true.obs;
  RxBool isShowPassword1 = true.obs;

  RxString phoneNumber = "".obs; // Store phone number

  @override
  void onInit() {
    super.onInit();
    // Fetch phone number from arguments
    phoneNumber.value = Get.arguments?["phone"] ?? "";
    debugPrint(
        "📞 Phone Number Received: ${phoneNumber.value}"); // ✅ Debugging print
  }

  @override
  void onClose() {
    super.onClose();
    passwordOneController.dispose();
    passwordTwoController.dispose();
  }

  Future<void> submitPassword() async {
    String phone = phoneNumber.value.trim(); // Ensure it's a string
    String password = passwordOneController.text.trim();
    String confirmPassword = passwordTwoController.text.trim();

    // Validate inputs
    if (phone.isEmpty) {
      debugPrint("❌ Error: Phone number is empty");
      return;
    }
    if (password.isEmpty || confirmPassword.isEmpty) {
      debugPrint("❌ Error: Password fields are empty");
      return;
    }
    if (password != confirmPassword) {
      debugPrint("❌ Error: Passwords do not match");
      return;
    }

    final url = Uri.parse(
        "https://loanapp-backend-xnak.onrender.com/api/auth/set-password");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": phone, "password": password}),
      );

      debugPrint("📩 API Request Sent: ${jsonEncode({
            "phone": phone,
            "password": password
          })}");
      debugPrint("📩 API Response: ${response.body}");

      if (response.statusCode == 200) {
        debugPrint("✅ Password successfully set. Redirecting...");
        Get.offNamed(AppRoutes.signInScreen);
      } else {
        debugPrint("❌ API Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      debugPrint("❌ Exception: $e");
    }
  }
}
