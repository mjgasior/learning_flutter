import 'dart:math';
import 'dart:convert';

import '../../network/recipe_model.dart';
import 'package:flutter/services.dart';
import '../recipe_card.dart';
import 'recipe_details.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_dropdown.dart';
import '../colors.dart';

class RecipeList extends StatefulWidget {
  const RecipeList({Key? key}) : super(key: key);

  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  static const String prefSearchKey = 'previousSearches';
  late TextEditingController searchTextController;
  final ScrollController _scrollController = ScrollController();
  List currentSearchList = [];
  int currentCount = 0;
  int currentStartPosition = 0;
  int currentEndPosition = 20;
  int pageCount = 20;
  bool hasMore = false;
  bool loading = false;
  bool inErrorState = false;
  List<String> previousSearches = <String>[];
  late ApiRecipeQuery _currentRecipes1;

  @override
  void initState() {
    super.initState();
    loadRecipes();
    getPreviousSearches();
    searchTextController = TextEditingController(text: '');
    _scrollController
      ..addListener(() {
        final triggerFetchMoreSize =
            0.7 * _scrollController.position.maxScrollExtent;

        if (_scrollController.position.pixels > triggerFetchMoreSize) {
          if (hasMore &&
              currentEndPosition < currentCount &&
              !loading &&
              !inErrorState) {
            setState(() {
              loading = true;
              currentStartPosition = currentEndPosition;
              currentEndPosition =
                  min(currentStartPosition + pageCount, currentCount);
            });
          }
        }
      });
  }

  Future loadRecipes() async {
    final jsonString = await rootBundle.loadString('assets/recipes1.json');
    setState(() {
      _currentRecipes1 = ApiRecipeQuery.fromJson(jsonDecode(jsonString));
    });
  }

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  void savePreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSearchKey)) {
      previousSearches = prefs.getStringList(prefSearchKey)!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildSearchCard(),
            _buildRecipeLoader(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  startSearch(searchTextController.text);
                  final currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                icon: const Icon(Icons.search)),
            const SizedBox(
              width: 6.0,
            ),
            Expanded(
                child: TextField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Search'),
              autofocus: false,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                if (!previousSearches.contains(value)) {
                  previousSearches.add(value);
                  savePreviousSearches();
                }
              },
              controller: searchTextController,
            )),
            PopupMenuButton<String>(
              icon: const Icon(Icons.arrow_drop_down, color: lightGrey),
              onSelected: (String value) {
                searchTextController.text = value;
                startSearch(searchTextController.text);
              },
              itemBuilder: (BuildContext context) {
                return previousSearches
                    .map<CustomDropdownMenuItem<String>>((String value) {
                  return CustomDropdownMenuItem<String>(
                      value: value,
                      text: value,
                      callback: () {
                        setState(() {
                          previousSearches.remove(value);
                          Navigator.pop(context);
                        });
                      });
                }).toList();
              },
            )
          ],
        ),
      ),
    );
  }

  void startSearch(String value) {
    setState(() {
      currentSearchList.clear();
      currentCount = 0;
      currentEndPosition = pageCount;
      currentStartPosition = 0;
      hasMore = true;
      if (!previousSearches.contains(value)) {
        previousSearches.add(value);
        savePreviousSearches();
      }
    });
  }

  Widget _buildRecipeLoader(BuildContext context) {
    if (searchTextController.text.length < 3) {
      return Container();
    }
    // Show a loading indicator while waiting for the movies
    return Center(
      child: _buildRecipeCard(context, _currentRecipes1.hits, 0),
    );
  }

  Widget _buildRecipeCard(BuildContext context, List<ApiHits> hits, int index) {
    final recipe = hits[index].recipe;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const RecipeDetails();
            }
          )
        );
      },
      child: recipeStringCard(recipe.image, recipe.label),
    );
  }
}
