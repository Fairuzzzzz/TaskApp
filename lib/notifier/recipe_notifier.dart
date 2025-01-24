import 'package:flutter/material.dart';
import 'package:taskapp/models/recipes_models.dart';
import 'package:taskapp/services/recipe_services.dart';

class RecipeNotifier extends ChangeNotifier {
  final RecipeServices _recipeServices = RecipeServices();
  List<RecipesModels> _recipes = [];
  List<RecipesModels> _filteredRecipes = [];
  List<RecipesModels> _hotRecipes = [];
  bool _isLoading = false;

  List<RecipesModels> get recipes => _recipes;
  List<RecipesModels> get filteredRecipes => _filteredRecipes;
  bool get isLoading => _isLoading;

  Future<void> loadRecipes() async {
    try {
      _isLoading = true;
      notifyListeners();

      final fetchedRecipes = await _recipeServices.getAllRecipes();
      _recipes = fetchedRecipes;
      _filteredRecipes = fetchedRecipes;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchRecipes(String query) {
    if (query.isEmpty) {
      _filteredRecipes = _recipes;
    } else {
      _filteredRecipes = _recipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(query.toLowerCase()) ||
              recipe.ingredients.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> toggleFavorite(RecipesModels recipe) async {
    try {
      final newFavoriteState = !recipe.isFavorite;

      if (newFavoriteState) {
        await _recipeServices.addToFavorites(recipe.id);
      } else {
        await _recipeServices.removeFavorite(recipe.id);
      }

      final mainIndex = _recipes.indexWhere((r) => r.id == recipe.id);
      final filteredIndex =
          _filteredRecipes.indexWhere((r) => r.id == recipe.id);
      final hotIndex = _hotRecipes.indexWhere((r) => r.id == recipe.id);

      if (mainIndex >= 0) _recipes[mainIndex].isFavorite = newFavoriteState;
      if (filteredIndex >= 0)
        _filteredRecipes[filteredIndex].isFavorite = newFavoriteState;
      if (hotIndex >= 0) _hotRecipes[hotIndex].isFavorite = newFavoriteState;

      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadHotRecipes() async {
    try {
      _isLoading = true;
      notifyListeners();

      final recipes = await _recipeServices.getAllRecipes();
      recipes.sort((a, b) => b.rating.compareTo(a.rating));
      _hotRecipes = recipes.take(2).toList();

      for (var hotRecipes in _hotRecipes) {
        final mainRecipe = _recipes.firstWhere(
          (r) => r.id == hotRecipes.id,
          orElse: () => hotRecipes,
        );
        hotRecipes.isFavorite = mainRecipe.isFavorite;
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  RecipesModels getRecipeById(int id) {
    return _recipes.firstWhere((recipe) => recipe.id == id);
  }
}
