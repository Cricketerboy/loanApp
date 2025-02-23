class SelectionPopupModel {
  SelectionPopupModel({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false, // Fixed syntax error
  });

  int? id;
  String title;
  dynamic value;
  bool isSelected;
}
