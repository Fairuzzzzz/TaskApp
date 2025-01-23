import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskapp/models/recipes_models.dart';
import 'package:taskapp/pages/recipes_details.dart';
import 'package:taskapp/services/recipe_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchValue = 'Pesto Pasta';
  final RecipeServices _recipeServices = RecipeServices();
  List<RecipesModels> hotRecipes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadHotRecipes();
  }

  Future<void> _loadHotRecipes() async {
    try {
      final recipes = await _recipeServices.getAllRecipes();
      setState(() {
        recipes.sort((a, b) => b.rating.compareTo(a.rating));
        hotRecipes = recipes.take(2).toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final safeHeight = size.height - padding.top - padding.bottom;
    final dynamicFontSize = size.width * 0.04;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: padding.top + kToolbarHeight + 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "Hottest Recipes",
                        style: TextStyle(
                            color: Colors.black, fontSize: dynamicFontSize),
                      ),
                    ),
                    SizedBox(
                      height: safeHeight * 0.012,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: hotRecipes
                            .map((recipe) => _buildRecipeCard(
                                context: context,
                                recipe: recipe,
                                width: constraints.maxWidth * 0.43,
                                height: safeHeight * 0.27,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RecipesDetailsPage(recipes: recipe),
                                    ),
                                  );
                                }))
                            .toList()),
                    SizedBox(
                      height: safeHeight * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text("Featured",
                          style: TextStyle(
                              color: Colors.black, fontSize: dynamicFontSize)),
                    ),
                    SizedBox(
                      height: safeHeight * 0.012,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: double.infinity,
                        height: constraints.maxWidth * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage("assets/images/image.png"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(
                      height: safeHeight * 0.012,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text("Select Recipes",
                          style: TextStyle(
                              color: Colors.black, fontSize: dynamicFontSize)),
                    ),
                    SizedBox(
                      height: safeHeight * 0.012,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: _buildCategoryGrid(constraints)),
                    SizedBox(
                      height: safeHeight * 0.02,
                    )
                  ],
                ),
              );
            }),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildRecipeCard({
    required BuildContext context,
    required RecipesModels recipe,
    required double width,
    required double height,
    required VoidCallback onTap,
  }) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final safeHeight = size.height - padding.top - padding.bottom;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: safeHeight * 0.23,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          double titleFontSize = constraints.maxWidth * 0.045;
          double descriptionFontSize = constraints.maxWidth * 0.035;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 2,
                  child: Container(
                    height: constraints.maxHeight * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(recipe.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(constraints.maxWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: titleFontSize * 1.7),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          recipe.ingredients,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: descriptionFontSize * 1.7),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow,
                                    size: titleFontSize * 1.5),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${recipe.rating}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: descriptionFontSize * 1.7,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${recipe.calories} kcal',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: descriptionFontSize * 1.7),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          );
        }),
      ),
    );
  }

  Widget _buildCategoryGrid(BoxConstraints constraints) {
    final itemWidth = (constraints.maxWidth - 96) / 4;
    final itemHeight = itemWidth;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCategoryItem('Breakfast', 'assets/icons/Breakfast.svg',
                itemWidth, itemHeight),
            _buildCategoryItem(
                'Dessert', 'assets/icons/Dessert.svg', itemWidth, itemHeight),
            _buildCategoryItem('Appetisers', 'assets/icons/Appetiser.svg',
                itemWidth, itemHeight),
            _buildCategoryItem(
                'Lunch', 'assets/icons/Lunch.svg', itemWidth, itemHeight),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildCategoryItem(
                'Supper', 'assets/icons/Supper.svg', itemWidth, itemHeight),
            _buildCategoryItem(
                'Dinner', 'assets/icons/dinner.svg', itemWidth, itemHeight),
            _buildCategoryItem(
                'Diet', 'assets/icons/salad_dish.svg', itemWidth, itemHeight),
            _buildCategoryItem(
                'All', 'assets/icons/Block_Menu.svg', itemWidth, itemHeight),
          ],
        )
      ],
    );
  }

  Widget _buildCategoryItem(
      String title, String iconPath, double width, double height) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Color(0xFF449728), width: 1)),
      child: LayoutBuilder(builder: (context, constraints) {
        double calculatedFontSize = constraints.maxWidth * 0.14;
        double finalFontSize = calculatedFontSize.clamp(10.0, 14.0);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: constraints.maxWidth * 0.3,
              height: constraints.maxWidth * 0.3,
            ),
            SizedBox(height: 4),
            SizedBox(
              width: constraints.maxWidth * 0.9,
              child: Text(
                title,
                style: TextStyle(
                    color: Color(0xFF449728), fontSize: finalFontSize),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      }),
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 60,
      title: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/Title.svg',
              color: Colors.white,
            ),
            Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                    onTap: () {
                      setState(() {
                        _searchValue = '';
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                        isDense: true,
                        labelText: _searchValue,
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            overflow: TextOverflow.visible),
                        alignLabelWithHint: true,
                        border: InputBorder.none))),
            SvgPicture.asset(
              'assets/icons/ShoppingCart.svg',
              height: 36,
              width: 36,
              color: Colors.white,
            )
          ],
        );
      }),
      backgroundColor: Color(0xFF9BD886),
    );
  }
}
