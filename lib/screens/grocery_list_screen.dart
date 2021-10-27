import 'package:flutter/material.dart';
import 'package:learning_dart/components/components.dart';
import 'package:learning_dart/models/models.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager manager;

  const GroceryListScreen({Key? key, required this.manager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            final item = groceryItems[index];
            // TODO 28
            // TODO 27
            return GroceryTile(
              key: Key(item.id as String),
              item: item,
              onComplete: (change) {
                manager.completeItem(index, change == true);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 18.0);
          },
          itemCount: groceryItems.length),
    );
  }
}
