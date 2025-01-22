class RecipesModels {
  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final String ingredients;
  final String eattime;
  final String from;
  final String nutrition;
  final int calories;
  final int rating;
  bool isFavorite;

  RecipesModels({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.eattime,
    required this.from,
    required this.nutrition,
    required this.calories,
    required this.rating,
    this.isFavorite = false,
  });

  factory RecipesModels.fromJson(Map<String, dynamic> json) {
    return RecipesModels(
      id: json['id'],
      title: json['Title'],
      imageUrl: json['ImageURL'],
      description: json['Description'],
      ingredients: json['Ingredients'],
      eattime: json['Eattime'],
      from: json['From'],
      nutrition: json['Nutrition'],
      calories: json['Calories'],
      rating: json['Rating'],
      isFavorite: json['IsFavorite'] ?? false,
    );
  }
}
