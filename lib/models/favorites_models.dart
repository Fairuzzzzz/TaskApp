class FavoritesModels {
  final String title;
  final String imageUrl;
  final String description;
  final int rating;
  final int review;

  FavoritesModels({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.review,
  });

  static List<FavoritesModels> favorites = [
    FavoritesModels(
        title: "Pesto Pasta",
        imageUrl: "assets/images/PestoPasta.jpg",
        description: "Pesto Pasta is a simple and delicious dish",
        rating: 4,
        review: 46),
    FavoritesModels(
        title: "Chocolate Muffin",
        imageUrl: "assets/images/ChocolateMuffin.jpg",
        description: "Chocolate Muffin is a delicious dessert",
        rating: 5,
        review: 34),
    FavoritesModels(
        title: "Veggie Pizza",
        imageUrl: "assets/images/VeggiePizza.jpg",
        description: "Veggie Pizza is a healthy and delicious dish",
        rating: 4,
        review: 45),
    FavoritesModels(
        title: "Caprese Salad",
        imageUrl: "assets/images/CapreseSalad.jpg",
        description: "Caprese Salad is a simple and delicious dish",
        rating: 5,
        review: 56)
  ];
}
