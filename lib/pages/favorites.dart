import 'package:flutter/material.dart';
import 'package:taskapp/models/favorites_models.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    List<FavoritesModels> favorites = FavoritesModels.favorites;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(color: Color(0xFF9BD886)),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(
              Icons.add,
              color: Color(0xFF9BD886),
              size: 32,
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(favorites[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            )),
                        Text(favorites[index].description,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text(favorites[index].rating.toString())
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ));
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
