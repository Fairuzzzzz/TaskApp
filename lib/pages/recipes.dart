import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskapp/models/recipes_models.dart';
import 'package:taskapp/pages/recipes_details.dart';
import 'package:taskapp/services/recipe_services.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final RecipeServices _recipeServices = RecipeServices();
  List<RecipesModels> recipes = [];
  List<RecipesModels> filteredRecipes = [];
  bool isLoading = true;
  String searchValue = "Search Recipes...";
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    try {
      final fetchedRecipes = await _recipeServices.getAllRecipes();
      setState(() {
        recipes = fetchedRecipes;
        filteredRecipes = recipes;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void searchRecipes(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredRecipes = recipes;
      } else {
        filteredRecipes = recipes
            .where((recipe) =>
                recipe.title.toLowerCase().contains(query.toLowerCase()) ||
                recipe.ingredients.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double gridPadding = size.width * 0.02;
    final double cardHeight = size.height * 0.25;

    final double titleFontSize = size.width * 0.045;
    final double descriptionFontSize = size.width * 0.035;

    return Scaffold(
      appBar: _appBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : LayoutBuilder(builder: (context, constraints) {
              return Padding(
                  padding: EdgeInsets.all(8),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: gridPadding * 2,
                        mainAxisSpacing: gridPadding * 3,
                        childAspectRatio: size.width > 600 ? 1.5 : 1.2,
                      ),
                      itemCount: filteredRecipes.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecipesDetailsPage(
                                          recipes: filteredRecipes[index],
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 5,
                                      offset: Offset(0, 3))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                filteredRecipes[index]
                                                    .imageUrl),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    child: Text(
                                      filteredRecipes[index].title,
                                      style: TextStyle(
                                          fontSize: titleFontSize * 0.7,
                                          color: Colors.black),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    filteredRecipes[index].ingredients,
                                    style: TextStyle(
                                        fontSize: descriptionFontSize * 0.8,
                                        color: Colors.grey),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: titleFontSize * 0.8,
                                              ),
                                            ),
                                            Text(
                                                filteredRecipes[index]
                                                    .rating
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize:
                                                        descriptionFontSize *
                                                            0.8,
                                                    color: Colors.black))
                                          ]),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          '${filteredRecipes[index].calories} kcal',
                                          style: TextStyle(
                                              fontSize:
                                                  descriptionFontSize * 0.8,
                                              color: Colors.grey),
                                        ),
                                      )
                                    ])
                              ],
                            ),
                          ),
                        );
                      }));
            }),
      backgroundColor: Colors.white,
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: TextField(
                  onTap: () {
                    setState(() {
                      searchValue = '';
                    });
                  },
                  controller: searchController,
                  onChanged: searchRecipes,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                      isDense: true,
                      labelText: searchValue,
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          overflow: TextOverflow.visible),
                      alignLabelWithHint: true,
                      border: InputBorder.none)),
            ),
            SvgPicture.asset(
              'assets/icons/Funnel.svg',
              width: 36,
              height: 36,
              color: Colors.white,
            )
          ],
        );
      }),
      backgroundColor: Color(0xFF9BD886),
    );
  }
}
