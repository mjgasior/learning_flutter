import 'package:flutter/material.dart';
import 'package:learning_dart/api/mock_fooderlich_service.dart';
import 'package:learning_dart/components/components.dart';
import 'package:learning_dart/models/models.dart';

class ExploreScreen extends StatefulWidget {

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExploreData>(
        future: mockService.getExploreData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final recipes = snapshot.data!.todayRecipes;
            return ListView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              children: [
                TodayRecipeListView(recipes: recipes),
                const SizedBox(height: 16),
                FriendPostListView(friendPosts: snapshot.data!.friendPosts)
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("The bottom!");
    }

    if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("The top!");
    }
  }
}
