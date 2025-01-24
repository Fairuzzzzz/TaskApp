import 'package:flutter/material.dart';
import 'package:taskapp/models/recipes_models.dart';
import 'package:taskapp/services/recipe_services.dart';

class FavoriteNotifier extends ChangeNotifier {
  final RecipeServices recipeServices = RecipeServices();
  List<RecipesModels> _favorites = [];
  bool _isLoading = false;

  List<RecipesModels> get favorites => _favorites;
  bool get isLoading => _isLoading;

  Future<void> loadFavorites() async {
    try {
      _isLoading = true;
      notifyListeners();

      final recipes = await recipeServices.getAllRecipes();
      _favorites = recipes.where((recipe) => recipe.isFavorite).toList();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }
}
