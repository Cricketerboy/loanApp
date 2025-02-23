import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loanapp/routes/app_routes.dart';

/// Controller for the PAN details screen
class DetailsFourController extends GetxController {
  TextEditingController panController = TextEditingController();
  Rx<DetailsFourModel> detailsFourModelObj = DetailsFourModel().obs;

  RxString phoneNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
    // Retrieve phone number from arguments
    phoneNumber.value = Get.arguments["phone"] ?? "";
    debugPrint("📱 Phone Number Received: ${phoneNumber.value}");
  }

  @override
  void onClose() {
    super.onClose();
    panController.dispose();
  }

  /// Save PAN to backend
  Future<void> savePan() async {
    final url = Uri.parse(
        "https://loanapp-backend-xnak.onrender.com/api/user/save-pan");

    String panNumber = panController.text.trim();
    if (panNumber.isEmpty) {
      debugPrint("❌ Error: PAN Number is required");
      Get.snackbar("Error", "PAN Number is required",
          backgroundColor: Colors.red);
      return;
    }

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone": phoneNumber.value,
          "panNumber": panNumber,
        }),
      );

      debugPrint("📩 API Request Sent: ${jsonEncode({
            "phone": phoneNumber.value,
            "panNumber": panNumber,
          })}");

      debugPrint("📩 API Response: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "PAN saved successfully",
            backgroundColor: Colors.green);

        // ✅ Navigate to the next screen after saving PAN
        Get.offNamed(AppRoutes.detailsThreeScreen,
            arguments: {"phone": phoneNumber.value});
      } else {
        debugPrint("❌ API Error: ${response.body}");
        Get.snackbar("Error", "Failed to save PAN",
            backgroundColor: Colors.red);
      }
    } catch (e) {
      debugPrint("❌ Exception: $e");
      Get.snackbar("Error", "Something went wrong",
          backgroundColor: Colors.red);
    }
  }
}

/// Model class for PAN details
class DetailsFourModel {}
