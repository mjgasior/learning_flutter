import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class ApiRecipeQuery {
  factory ApiRecipeQuery.fromJson(Map<String, dynamic> json) =>
      _$ApiRecipeQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRecipeQueryToJson(this);

  @JsonKey(name: 'q')
  String query;
  int from;
  int to;
  bool more;
  int count;
  List<ApiHits> hits;

  ApiRecipeQuery({
    required this.query,
    required this.from,
    required this.to,
    required this.more,
    required this.count,
    required this.hits,
  });
}

@JsonSerializable()
class ApiHits {
  factory ApiHits.fromJson(Map<String, dynamic> json) =>
      _$ApiHitsFromJson(json);

  Map<String, dynamic> toJson() => _$ApiHitsToJson(this);

  ApiRecipe recipe;

  ApiHits({ required this.recipe });
}

@JsonSerializable()
class ApiRecipe {
  factory ApiRecipe.fromJson(Map<String, dynamic> json) =>
      _$ApiRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$ApiRecipeToJson(this);

  String label;
  String image;
  String url;
  List<ApiIngredients> ingredients;
  double calories;
  double totalWeight;
  double totalTime;

  ApiRecipe({
    required this.label,
    required this.image,
    required this.url,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
  });

  String getCalories(double? calories) {
    if (calories == null) {
      return '0 kcal';
    }
    return calories.floor().toString() + ' kcal';
  }

  String getWeight(double? weight) {
    if (weight == null) {
      return '0 g';
    }
    return weight.floor().toString() + ' g';
  }
}

@JsonSerializable()
class ApiIngredients {
  factory ApiIngredients.fromJson(Map<String, dynamic> json) =>
      _$ApiIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$ApiIngredientsToJson(this);

  @JsonKey(name: 'text')
  String name;
  double weight;

  ApiIngredients({ required this.name, required this.weight});
}

