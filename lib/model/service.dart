class ButtonContent {
  int id;
  String name;
  String link;
  bool? isLocked;

  ButtonContent({
    required this.id,
    required this.name,
    required this.link,
    this.isLocked,
  });
}
