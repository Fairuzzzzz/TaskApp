import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskapp/pages/favorites.dart';
import 'package:taskapp/pages/home.dart';
import 'package:taskapp/pages/info.dart';
import 'package:taskapp/pages/profiles.dart';
import 'package:taskapp/pages/recipes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    HomePage(),
    FavoritesPage(),
    RecipesPage(),
    InfoPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              backgroundColor: Color(0xFF62CE3C),
              indicatorColor: Colors.transparent,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((state) {
                if (state.contains(WidgetState.selected)) {
                  return const TextStyle(color: Colors.grey, fontSize: 12);
                }
                return const TextStyle(color: Colors.white, fontSize: 12);
              })),
          child: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: [
                NavigationDestination(
                    icon: SvgPicture.asset(
                      'assets/icons/Home.svg',
                      color: _selectedIndex == 0 ? Colors.grey : Colors.white,
                    ),
                    label: "Home"),
                NavigationDestination(
                    icon: SvgPicture.asset('assets/icons/Star.svg',
                        color: _selectedIndex == 1 ? Colors.grey : Colors.white),
                    label: "Favorites"),
                NavigationDestination(
                    icon: SvgPicture.asset('assets/icons/PencilSquare.svg',
                        color: _selectedIndex == 2 ? Colors.grey : Colors.white),
                    label: "Recipes"),
                NavigationDestination(
                    icon: SvgPicture.asset('assets/icons/InformationCircle.svg',
                        color: _selectedIndex == 3 ? Colors.grey : Colors.white),
                    label: "Info"),
                NavigationDestination(
                    icon: SvgPicture.asset('assets/icons/UserCircle.svg',
                        color: _selectedIndex == 4 ? Colors.grey : Colors.white),
                    label: "Profiles"),
              ])),
    );
  }
}
