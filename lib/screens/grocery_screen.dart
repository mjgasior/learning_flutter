import 'package:flutter/material.dart';
import 'package:learning_dart/models/models.dart';
import 'package:learning_dart/screens/empty_grocery_screen.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  Widget buildGroceryScreen(BuildContext context) {
    return Consumer<GroceryManager>(
        builder: (context, manager, child) {
          if (manager.groceryItems.isNotEmpty) {
            return Container();
          } else {
            return const EmptyGroceryScreen();
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: buildGroceryScreen(context)
    );
  }
}
