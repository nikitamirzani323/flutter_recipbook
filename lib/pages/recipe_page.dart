import 'package:flutter/material.dart';
import 'package:recepies_card/models/recipe.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  RecipePage({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white60,
        title: const Text(
          "RecipBook",
        ),
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _recipeImage(context),
          _recipeDetail(context),
          _recipeIngridients(context),
          _recipeInstructions(context),
        ],
      ),
    );
  }

  Widget _recipeImage(
    BuildContext context,
  ) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.40,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            recipe.image,
          ),
        ),
      ),
    );
  }

  Widget _recipeDetail(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${recipe.cuisine} , ${recipe.difficulty}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            recipe.name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Prep Time: ${recipe.prepTimeMinutes} Minutes | Cook Time: ${recipe.cookTimeMinutes} Minutes",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "${recipe.rating.toString()}  | ${recipe.reviewCount} Reviews",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recipeIngridients(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Column(
        children: recipe.ingredients.map((i) {
          return Row(
            children: [
              const Icon(
                Icons.check_box,
              ),
              Text(
                "$i",
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _recipeInstructions(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 20.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: recipe.instructions.map(
          (i) {
            return Text(
              "${recipe.instructions.indexOf(i)}, $i\n",
              maxLines: 3,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 15.0,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
