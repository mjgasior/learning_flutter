import 'package:flutter/material.dart';
import 'package:learning_dart/api/mock_fooderlich_service.dart';
import 'package:learning_dart/models/models.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(future: mockService.getExploreData(),
    builder: (context, snapshot) {
     if (snapshot.connectionState == ConnectionState.done) {
       print("snapshot");
       print(snapshot);
       print("snapshot2");
       final recipes = snapshot.data!.todayRecipes;
       return Center(
         child: Container(
           child: const Text('Show today recipies list view'),
         ),
       );
     } else {
       return const Center(child: CircularProgressIndicator());
     }
    });
  }
}