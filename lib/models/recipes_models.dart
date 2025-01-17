class RecipesModels {
  final String title;
  final String imageUrl;
  final String description;
  final String ingredients;
  final String eattime;
  final String from;
  final String nutrition;
  final int calories;
  final int rating;

  RecipesModels(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.ingredients,
      required this.eattime,
      required this.from,
      required this.nutrition,
      required this.calories,
      required this.rating});

  static List<RecipesModels> recipes = [
    RecipesModels(
        title: "Pesto Pasta",
        imageUrl: "assets/images/PestoPasta.jpg",
        description: "Pesto pasta is a simple and delicious dish",
        ingredients: "Pasta, Basil, Cheese",
        eattime: "Lunch",
        from: "Italy",
        nutrition: "Vitamin A, Vitamin C, Calcium",
        calories: 400,
        rating: 4),
    RecipesModels(
        title: "Spaghetti Carbonara",
        imageUrl: "assets/images/SpaghettiCarbonara.jpg",
        description: "Spaghetti Carbonara is a classic pasta dish",
        ingredients: "Spaghetti, Pancetta, Cheese",
        eattime: "Dinner",
        from: "Italy",
        nutrition: "Vitamin A, Vitamin C, Calcium",
        calories: 300,
        rating: 5),
    RecipesModels(
      title: "Pesto Calabrese",
      imageUrl: "assets/images/PastaCalabrese.jpg",
      description: "Pesto Calabrese is a simple and delicious dish",
      ingredients: "Pasta, Basil, Cheese",
      eattime: "Lunch",
      from: "Italy",
      nutrition: "Vitamin A, Vitamin C, Calcium",
      calories: 200,
      rating: 4,
    ),
    RecipesModels(
        title: "Pomodoro Pesto",
        imageUrl: "assets/images/PastaPomodoro.jpg",
        description: "Pomodoro Pesto is a simple and delicious dish",
        ingredients: "Pasta, Basil, Cheese",
        eattime: "Lunch",
        from: "Italy",
        nutrition: "Vitamin A, Vitamin C, Calcium",
        calories: 200,
        rating: 4)
  ];
}
