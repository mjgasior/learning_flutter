import 'package:flutter/material.dart';
import 'package:learning_dart/api/mock_fooderlich_service.dart';
import 'package:learning_dart/components/components.dart';
import 'package:learning_dart/models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data!.todayRecipes;
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(recipes: recipes),
                const SizedBox(height: 16),
                Container(height: 400, color: Colors.green)
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
