import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loanapp/routes/app_routes.dart';

class DetailsThreeController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxString phoneNumber = "".obs; // Get phone from previous screen
  Rx<TextEditingController> otpController = TextEditingController().obs;
  Rx<DetailsThreeModel> detailsThreeModelObj = DetailsThreeModel().obs;

  @override
  void onInit() {
    super.onInit();
    // Retrieve phone number from arguments
    phoneNumber.value = Get.arguments["phone"] ?? "";
    debugPrint("📱 Phone Number Received: $phoneNumber");
  }

  Future<void> saveEmail() async {
    final url = Uri.parse("http://localhost:5000/api/user/save-email");

    String email = emailController.text.trim();

    if (email.isEmpty) {
      debugPrint("❌ Error: Email is required");
      return;
    }

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": phoneNumber.value,
          "email": email,
        }),
      );

      debugPrint("📩 API Request Sent: ${jsonEncode({
            "phone": phoneNumber.value,
            "email": email,
          })}");

      debugPrint("📩 API Response: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Email saved successfully",
            backgroundColor: Colors.green);

        // ✅ Navigate to the next screen after saving email
        Get.offNamed(AppRoutes.loanCalculatorScreen,
            arguments: {"phone": phoneNumber.value});
      } else {
        debugPrint("❌ API Error: ${response.body}");
      }
    } catch (e) {
      debugPrint("❌ Exception: $e");
    }
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
  }
}

class DetailsThreeModel {}
