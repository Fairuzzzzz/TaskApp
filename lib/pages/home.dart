import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskapp/models/recipes_models.dart';
import 'package:taskapp/pages/recipes_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchValue = 'Pesto Pasta';

  @override
  Widget build(BuildContext context) {
    List<RecipesModels> recipes = RecipesModels.recipes;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Hottest Recipes",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipesDetailsPage(
                                recipes: recipes[0],
                              )));
                },
                child: Container(
                  height: 160,
                  width: 180,
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
                          height: 80,
                          width: 180,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage(recipes[0].imageUrl),
                                  fit: BoxFit.cover))),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(recipes[0].title,
                                style: TextStyle(color: Colors.black)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(recipes[0].ingredients,
                            style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ),
                      SizedBox(height: 4),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                  Text('${recipes[0].rating}',
                                      style: TextStyle(color: Colors.grey))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text('${recipes[0].calories} kcal',
                                  style: TextStyle(color: Colors.grey)),
                            )
                          ])
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipesDetailsPage(
                                recipes: recipes[1],
                              )));
                },
                child: Container(
                    height: 160,
                    width: 180,
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
                          height: 80,
                          width: 180,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage(recipes[1].imageUrl),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(recipes[1].title,
                                  style: TextStyle(color: Colors.black)),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(recipes[1].ingredients,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12)),
                        ),
                        SizedBox(height: 4),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 16,
                                    ),
                                    Text('${recipes[1].rating}',
                                        style: TextStyle(color: Colors.grey))
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('${recipes[1].calories} kcal',
                                    style: TextStyle(color: Colors.grey)),
                              )
                            ])
                      ],
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text("Featured",
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage("assets/images/image.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text("Select Recipes",
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF449728), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Breakfast.svg',
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(height: 4),
                            Text("Breakfast",
                                style: TextStyle(color: Color(0xFF449728)))
                          ],
                        )),
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF449728), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/Dessert.svg',
                                width: 26, height: 26),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Dessert",
                                style: TextStyle(color: Color(0xFF449728)))
                          ],
                        )),
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF449728), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/Appetiser.svg',
                                width: 26, height: 26),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Appetisers",
                                style: TextStyle(color: Color(0xFF449728)))
                          ],
                        )),
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF449728), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/Lunch.svg',
                                width: 26, height: 26),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Lunch",
                                style: TextStyle(color: Color(0xFF449728)))
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF449728), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/Supper.svg',
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(height: 4),
                            Text("Supper",
                                style: TextStyle(color: Color(0xFF449728)))
                          ],
                        )),
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF449728), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/dinner.svg',
                                width: 26, height: 26),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Dinner",
                                style: TextStyle(color: Color(0xFF449728)))
                          ],
                        )),
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF449728), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/salad_dish.svg',
                                width: 26, height: 26),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Diet",
                                style: TextStyle(color: Color(0xFF449728)))
                          ],
                        )),
                    Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Color(0xFF449728), width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/Block_Menu.svg',
                                width: 26, height: 26),
                            SizedBox(
                              height: 4,
                            ),
                            Text("All",
                                style: TextStyle(color: Color(0xFF449728)))
                          ],
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  AppBar _appBar() {
    return AppBar(
      toolbarHeight: 60,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/icons/Title.svg',
            color: Colors.white,
          ),
          Container(
              height: 40,
              width: 220,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
      ),
      backgroundColor: Color(0xFF9BD886),
    );
  }
}
