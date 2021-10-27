import 'package:flutter/material.dart';
import 'package:learning_dart/components/components.dart';
import 'package:learning_dart/models/models.dart';
import 'package:learning_dart/screens/grocery_item_screen.dart';

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

            return InkWell(
              child: GroceryTile(
                key: Key(item.id as String),
                item: item,
                onComplete: (change) {
                  manager.completeItem(index, change == true);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroceryItemScreen(originalItem: item,
                      onUpdate: (item) {
                    manager.updateItem(item, index);
                      Navigator.pop(context);
                      }))
                );
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
