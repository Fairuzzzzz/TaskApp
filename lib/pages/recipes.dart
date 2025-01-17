import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskapp/models/recipes_models.dart';
import 'package:taskapp/pages/recipes_details.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  List<RecipesModels> recipes = RecipesModels.recipes;
  List<RecipesModels> filteredRecipes = [];
  String searchValue = "Search Recipes...";
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRecipes = recipes;
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
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 320,
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: TextField(
                  onTap: () {
                    setState(() {
                      searchValue = '';
                    });
                  },
                  controller: searchController,
                  onChanged: searchRecipes,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                      isDense: true,
                      labelText: searchValue,
                      labelStyle: TextStyle(
                          color: Colors.grey, fontSize: 14, overflow: TextOverflow.visible),
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
        ),
        backgroundColor: Color(0xFF9BD886),
      ),
      body: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 24,
                childAspectRatio: 2.7 / 2,
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
                    height: 300,
                    width: double.infinity,
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
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage(filteredRecipes[index].imageUrl),
                                  fit: BoxFit.cover)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(filteredRecipes[index].title,
                              style: TextStyle(fontSize: 12, color: Colors.black)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(filteredRecipes[index].ingredients,
                              style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ),
                        SizedBox(height: 4),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                ),
                                Text(filteredRecipes[index].rating.toString(),
                                    style: TextStyle(fontSize: 12, color: Colors.black))
                              ]),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '${filteredRecipes[index].calories} kcal',
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              )
                            ])
                      ],
                    ),
                  ),
                );
              })),
      backgroundColor: Colors.white,
    );
  }
}
