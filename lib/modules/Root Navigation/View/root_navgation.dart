import 'package:flutter/material.dart';

import '../../Profile/View/profile.dart';
import '../../home/View/home2_view.dart';
import '../../home/View/home_view.dart';

class RootNavigationView extends StatefulWidget {
  const RootNavigationView({super.key});

  @override
  State<RootNavigationView> createState() => _RootNavigationViewState();
}

class _RootNavigationViewState extends State<RootNavigationView> {
  int _selectedIndex = 0;

  List screens = [
    const HomeView(),
    const Home2View(
      title: 'Home2',
      type: HomeTypes.home2,
    ),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.amber,
        currentIndex: _selectedIndex,
        onTap: (currentIndex) {
          setState(() {
            _selectedIndex = currentIndex;
          });
        },
      ),
    );
  }
}
