class ButtonContent {
  int id;
  String name;
  String link;
  bool? isConfirm;

  ButtonContent({
    required this.id,
    required this.name,
    required this.link,
    this.isConfirm,
  });
}
