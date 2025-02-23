import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ApplicationStatusOneController extends GetxController {
  TextEditingController applicationUnderReviewController =
      TextEditingController();
  TextEditingController eKycController = TextEditingController();
  TextEditingController eNachController = TextEditingController();
  TextEditingController eSignController = TextEditingController();
  TextEditingController disbursementController = TextEditingController();

  Rx<ApplicationStatusOneModel> applicationStatusOneModelObj =
      ApplicationStatusOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    applicationUnderReviewController.dispose();
    eKycController.dispose();
    eNachController.dispose();
    eSignController.dispose();
    disbursementController.dispose();
  }
}

class ApplicationStatusOneModel {}
