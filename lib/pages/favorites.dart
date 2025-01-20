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
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    final safeHeight = size.height - padding.top - padding.bottom;
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
      body: LayoutBuilder(builder: (context, constraints) {
        double titleFontSize = constraints.maxWidth * 0.045;
        double descriptionFontSize = constraints.maxWidth * 0.035;
        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.05, vertical: 12),
                height: constraints.maxHeight * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                fontSize: titleFontSize * 0.8,
                                color: Colors.black,
                              )),
                          SizedBox(
                            width: constraints.maxWidth * 0.45,
                            child: Text(
                              favorites[index].description,
                              style: TextStyle(
                                  fontSize: descriptionFontSize * 0.7,
                                  color: Colors.black),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: titleFontSize * 1,
                              ),
                              SizedBox(width: 4),
                              Text(
                                favorites[index].rating.toString(),
                                style:
                                    TextStyle(fontSize: titleFontSize * 0.75),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Container(
                        height: safeHeight * 0.2,
                        width: safeHeight * 0.122,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage(favorites[index].imageUrl),
                                fit: BoxFit.cover)),
                      ),
                    )
                  ],
                ));
          },
        );
      }),
      backgroundColor: Colors.white,
    );
  }
}
