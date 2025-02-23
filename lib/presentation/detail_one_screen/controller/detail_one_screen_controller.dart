import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:loanapp/data/model/selection_popup_model.dart';
import 'package:loanapp/routes/app_routes.dart';

class DetailsOneController extends GetxController {
  TextEditingController firstNameInputController = TextEditingController();
  TextEditingController lastNameInputController = TextEditingController();
  TextEditingController dateOfBirthInputController = TextEditingController();

  Rx<DetailsOneModel> detailsOneModelObj = DetailsOneModel().obs;
  SelectionPopupModel? selectedDropDownValue; // Gender
  SelectionPopupModel? selectedDropDownValue1; // Marital status

  RxString phoneNumber = "".obs; // Store phone number from arguments

  @override
  void onInit() {
    super.onInit();
    // Retrieve phone number from arguments
    phoneNumber.value = Get.arguments["phone"] ?? "";
    debugPrint("📱 Phone Number Received: $phoneNumber");
  }

  @override
  void onClose() {
    super.onClose();
    firstNameInputController.dispose();
    lastNameInputController.dispose();
    dateOfBirthInputController.dispose();
  }

  void onSelected(dynamic value) {
    for (var element in detailsOneModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
        selectedDropDownValue = element;
      }
    }
    detailsOneModelObj.value.dropdownItemList.refresh();
  }

  void onSelected1(dynamic value) {
    for (var element in detailsOneModelObj.value.dropdownItemList1.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
        selectedDropDownValue1 = element;
      }
    }
    detailsOneModelObj.value.dropdownItemList1.refresh();
  }

  Future<void> saveBasicDetails() async {
    final url = Uri.parse(
        "https://loanapp-backend-xnak.onrender.com/api/user/save-basic-details");

    String firstName = firstNameInputController.text.trim();
    String lastName = lastNameInputController.text.trim();
    String dob = dateOfBirthInputController.text.trim();
    String gender = selectedDropDownValue?.title ?? "Male"; // Default Male

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        dob.isEmpty ||
        gender.isEmpty) {
      debugPrint("❌ Error: All fields are required");
      return;
    }

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "phone":
              phoneNumber.value, // Use the phone number received from arguments
          "firstName": firstName,
          "lastName": lastName,
          "dob": dob,
          "gender": gender,
        }),
      );

      debugPrint("📩 API Request Sent: ${jsonEncode({
            "phone": phoneNumber.value,
            "firstName": firstName,
            "lastName": lastName,
            "dob": dob,
            "gender": gender,
          })}");

      debugPrint("📩 API Response: ${response.body}");

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Details saved successfully",
            backgroundColor: Colors.green);
        Get.offNamed(AppRoutes.detailsFourScreen,
            arguments: {"phone": phoneNumber.value});
      } else {
        debugPrint("❌ API Error: ${response.body}");
      }
    } catch (e) {
      debugPrint("❌ Exception: $e");
    }
  }
}

class DetailsOneModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(id: 1, title: "Male", isSelected: true),
    SelectionPopupModel(id: 2, title: "Female"),
    SelectionPopupModel(id: 3, title: "Other"),
  ]);

  Rx<DateTime>? selectedDateOfBirthInput = Rx(DateTime.now());

  Rx<List<SelectionPopupModel>> dropdownItemList1 = Rx([
    SelectionPopupModel(id: 1, title: "Single", isSelected: true),
    SelectionPopupModel(id: 2, title: "Married"),
    SelectionPopupModel(id: 3, title: "Other"),
  ]);
}
