class RecipesModels {
  final String title;
  final String imageUrl;
  final String description;
  final String ingredients;
  final int calories;
  final int rating;

  RecipesModels(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.ingredients,
      required this.calories,
      required this.rating});

  static List<RecipesModels> recipes = [
    RecipesModels(
        title: "Pesto Pasta",
        imageUrl: "",
        description: "Pesto pasta is a simple and delicious dish",
        ingredients: "Pasta, Basil, Cheese",
        calories: 400,
        rating: 4),
    RecipesModels(
        title: "Spaghetti Carbonara",
        imageUrl: "",
        description: "Spaghetti Carbonara is a classic pasta dish",
        ingredients: "Spaghetti, Pancetta, Cheese",
        calories: 300,
        rating: 5)
  ];
}
