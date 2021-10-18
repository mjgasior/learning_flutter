class Recipe {
  int servings;
  List<Ingredient> ingredients;
  String label;
  String imageUrl;

  Recipe(this.label, this.imageUrl, this.servings, this.ingredients);

  static List<Recipe> samples = [
    Recipe("Spagetti", "assets/spageti.jpeg", 1, [
      Ingredient(100, "grams", "Pasta"),
      Ingredient(300, "grams", "Tomatoes")
    ]),
    Recipe("Prażony syr", "assets/syr.jpg", 5, [
      Ingredient(150, "grams", "Gouda cheese"),
      Ingredient(1, "box", "Bread crumbs")
    ]),
    Recipe("Tacosy", "assets/tacosy.jpeg", 7, [
      Ingredient(7, "loaf", "Tortilla"),
      Ingredient(1, "", "Salad"),
      Ingredient(21, "", "Cherry tomatoes"),
    ]),
  ];
}

class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}
