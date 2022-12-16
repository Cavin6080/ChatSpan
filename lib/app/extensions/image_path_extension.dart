extension ImagePath on String {
  String get toSvg => "assets/svg/$this.svg";
  String get toPng => "assets/png/$this.png";
  String get toJpg => "assets/images/$this.jpg";
}
