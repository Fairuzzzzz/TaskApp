class FavoritesModels {
  final int id;
  final int recipeId;
  final int userId;

  FavoritesModels({
    required this.id,
    required this.recipeId,
    required this.userId,
  });

  factory FavoritesModels.fromJson(Map<String, dynamic> json) {
    return FavoritesModels(
      id: json['id'],
      recipeId: json['recipeId'],
      userId: json['userId'],
    );
  }
}
