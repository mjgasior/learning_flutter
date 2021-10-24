import 'package:flutter/material.dart';
import 'package:learning_dart/models/models.dart';
import 'package:provider/provider.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset('assets/fooderlich_assets/empty_list.png'),
            ),
            const SizedBox(height: 16),
            const Text('No groceries', style: TextStyle(fontSize: 21.0)),
            const SizedBox(height: 16),
            const Text(
                'Shopping for ingredients?\n'
                'Tap the + button to write them down!',
                textAlign: TextAlign.center),
            MaterialButton(
              textColor: Colors.white,
              child: const Text('Browse recipes'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              color: Colors.green,
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToRecipes();
              },
            )
          ],
        ));
  }
}
