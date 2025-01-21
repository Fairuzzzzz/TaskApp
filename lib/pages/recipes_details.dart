import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskapp/models/recipes_models.dart';

class RecipesDetailsPage extends StatefulWidget {
  final RecipesModels recipes;
  const RecipesDetailsPage({super.key, required this.recipes});

  @override
  State<RecipesDetailsPage> createState() => _RecipesDetailsPageState();
}

class _RecipesDetailsPageState extends State<RecipesDetailsPage> {
  int counter = 0;
  String selectedValue = 'Ingredients';

  Widget _buildSelectionBlock(String text, bool isSelected, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.white,
            border: Border.all(color: isSelected ? Colors.white : Colors.green),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: isSelected ? Colors.white : Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            if (selectedValue == 'Ingredients')
              ...widget.recipes.ingredients.split(',').map((ingredient) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: Color(0xFF9BD886), shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(ingredient.trim(),
                            style: TextStyle(color: Colors.grey, fontSize: 16))
                      ],
                    ));
              })
            else
              ...widget.recipes.nutrition.split(',').map((nutritions) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: Color(0xFF9BD886), shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(nutritions.trim(),
                            style: TextStyle(color: Colors.grey, fontSize: 16))
                      ],
                    ));
              })
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes',
            style: TextStyle(
              color: Color(0xFF9BD886),
            )),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_rounded),
            color: Color(0xFF9BD886)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(widget.recipes.imageUrl),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  widget.recipes.title,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ArrowUpTray.svg',
                      color: Colors.grey,
                    ),
                    SizedBox(width: 16),
                    SvgPicture.asset(
                      'assets/icons/Heart.svg',
                      color: Colors.grey,
                    )
                  ],
                )
              ]),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.recipes.rating.toString(),
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text(widget.recipes.description,
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/utensils.svg',
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.recipes.eattime,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset(
                    'assets/icons/GlobeAlt.svg',
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(widget.recipes.from,
                      style: TextStyle(color: Colors.grey, fontSize: 16))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Servings',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      if (counter > 0) {
                        counter--;
                      }
                    }),
                    icon: Icon(Icons.remove),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('$counter',
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      counter++;
                    }),
                    icon: Icon(Icons.add),
                    color: Colors.grey,
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSelectionBlock(
                      'Ingredients',
                      selectedValue == 'Ingredients',
                      () => setState(() => selectedValue = 'Ingredients')),
                  _buildSelectionBlock(
                      'Nutritions',
                      selectedValue == 'Nutritions',
                      () => setState(() => selectedValue = 'Nutritions')),
                ],
              ),
              _buildContent(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green),
                ),
                child: Center(
                  child: Text('Add to trolley',
                      style: TextStyle(color: Colors.green, fontSize: 16)),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                  child: Text('Order now',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
