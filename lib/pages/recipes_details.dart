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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'Ingredients',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.green)),
                  child: Center(
                    child: Text(
                      'Nutritions',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
              ],
            )
          ],
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
