class Recipe {
  String label;
  String imageUrl;

  Recipe(this.label, this.imageUrl);

  static List<Recipe> samples = [
    Recipe("Spagetti", "assets/spageti.jpeg"),
    Recipe("Prażony syr", "assets/syr.jpg"),
    Recipe("Tacosy", "assets/tacosy.jpeg"),
  ];
}
