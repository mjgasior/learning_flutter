import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.recipe.label)),
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(image: AssetImage(widget.recipe.imageUrl))),
            const SizedBox(height: 4),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: widget.recipe.ingredients.length,
                    padding: const EdgeInsets.all(7.0),
                    itemBuilder: (BuildContext context, int index) {
                      final ingredient = widget.recipe.ingredients[index];
                      return Text(
                          '${ingredient.quantity} ${ingredient.measure} ${ingredient.name}');
                    }))
          ],
        )));
  }
}
