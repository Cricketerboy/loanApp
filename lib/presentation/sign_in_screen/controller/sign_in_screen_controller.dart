import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:loanapp/routes/app_routes.dart';

class SignInScreenController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('91').obs;

  RxBool isShowPassword = true.obs;

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
    passwordController.dispose();
  }

  Future<void> signIn() async {
    String phone =
        "+${selectedCountry.value.phoneCode}${phoneNumberController.text.trim()}";
    String password = passwordController.text.trim();

    // Validate inputs
    if (phone.isEmpty || password.isEmpty) {
      debugPrint("❌ Error: Phone number or password is empty");
      return;
    }

    final url =
        Uri.parse("https://loanapp-backend-xnak.onrender.com/api/auth/signin");

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
        // Successful login
        var responseData = jsonDecode(response.body);
        debugPrint("✅ Sign-in successful: ${responseData}");

        // Navigate to the next screen (adjust route as needed)
        Get.offNamed(AppRoutes.detailsOneScreen, arguments: {"phone": phone});
      } else {
        debugPrint("❌ API Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      debugPrint("❌ Exception: $e");
    }
  }
}

class SignInModel {}
