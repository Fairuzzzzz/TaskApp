import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/notifier/recipe_notifier.dart';
import 'package:taskapp/pages/recipes_details.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  String searchValue = "Search Recipes...";
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<RecipeNotifier>().loadRecipes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double gridPadding = size.width * 0.02;
    final double titleFontSize = size.width * 0.045;
    final double descriptionFontSize = size.width * 0.035;

    return Scaffold(
      appBar: _appBar(),
      body: Consumer<RecipeNotifier>(
        builder: (context, recipeNotifier, child) {
          if (recipeNotifier.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              return RefreshIndicator.adaptive(
                color: Color(0xFF9BD886),
                displacement: 30,
                onRefresh: () async {
                  await recipeNotifier.loadRecipes();
                },
                child: recipeNotifier.recipes.isEmpty
                    ? SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: constraints.maxHeight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text("No recipes found"),
                              )
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: gridPadding * 2,
                            mainAxisSpacing: gridPadding * 3,
                            childAspectRatio: size.width > 600 ? 1.5 : 1.2,
                          ),
                          itemCount: recipeNotifier.filteredRecipes.length,
                          itemBuilder: (context, index) {
                            final recipe =
                                recipeNotifier.filteredRecipes[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RecipesDetailsPage(recipes: recipe),
                                  ),
                                );
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
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                image:
                                                    AssetImage(recipe.imageUrl),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        child: Text(
                                          recipe.title,
                                          style: TextStyle(
                                              fontSize: titleFontSize * 0.7,
                                              color: Colors.black),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        recipe.ingredients,
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
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: titleFontSize * 0.8,
                                                  ),
                                                ),
                                                Text(recipe.rating.toString(),
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
                                              '${recipe.calories} kcal',
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
                          },
                        ),
                      ),
              );
            },
          );
        },
      ),
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
                  onChanged: (value) {
                    context.read<RecipeNotifier>().searchRecipes(value);
                  },
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
