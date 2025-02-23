import 'package:get/get.dart';
import 'package:loanapp/data/model/selection_popup_model.dart';

class LoanCalculatorController extends GetxController {
  Rx<LoanCalculatorModel> loanCalculatorModelObj = LoanCalculatorModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  // 🔹 Separate reactive variables for each slider
  RxInt loanAmount = 5000.obs; // Slider 1
  RxInt interestRate = 25.obs; // Slider 2

  void onSelected(dynamic value) {
    for (var element in loanCalculatorModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    loanCalculatorModelObj.value.dropdownItemList.refresh();
  }
}

class LoanCalculatorModel {
  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
    SelectionPopupModel(id: 2, title: "Item Two"),
    SelectionPopupModel(id: 3, title: "Item Three"),
  ]);
}
