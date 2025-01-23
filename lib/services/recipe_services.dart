import 'dart:convert';

import 'package:taskapp/models/favorites_models.dart';
import 'package:taskapp/models/recipes_models.dart';
import 'package:http/http.dart' as http;

class RecipeServices {
  static const String baseUrl = 'http://10.0.2.2:8080';

  Future<List<RecipesModels>> getAllRecipes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/recipes/all'));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => RecipesModels.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      throw Exception('Failed to load recipes');
    }
  }

  Future<void> addToFavorites(int recipeId) async {
    final response = await http.post(Uri.parse('$baseUrl/favorites/add'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'recipeId': recipeId}));
    if (response.statusCode != 201) {
      throw Exception('Failed to add to favorites');
    }
  }

  Future<List<FavoritesModels>> getFavorites() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/favorites/all'));
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => FavoritesModels.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load favorites');
      }
    } catch (e) {
      throw Exception('Failed to load favorites');
    }
  }

  Future<void> removeFavorite(int favoriteID) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/favorites/recipe/$favoriteID'));
    if (response.statusCode != 200) {
      throw Exception('Failed to remove favorite');
    }
  }
}
