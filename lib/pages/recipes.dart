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
  String searchValue = "Pesto Pasta";
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
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: TextField(
                  onTap: () {
                    setState(() {
                      searchValue = '';
                    });
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
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipesDetailsPage(
                                  recipes: recipes[index],
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
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(recipes[index].title,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(recipes[index].ingredients,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey)),
                        ),
                        SizedBox(height: 4),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                ),
                                Text(recipes[index].rating.toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black))
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '${recipes[index].calories} kcal',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
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
