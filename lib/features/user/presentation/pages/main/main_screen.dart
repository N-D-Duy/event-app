import 'package:event_app/features/user/presentation/pages/main/home/home_page.dart';
import 'package:event_app/features/user/presentation/pages/main/profile/profile_page.dart';
import 'package:event_app/features/user/presentation/pages/main/search/search_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        pages.elementAt(_selectedIndex),
        Container(
          margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  child: BottomNavigationBar(
                    elevation: 0.5,
                    backgroundColor: Colors.white.withOpacity(0.8),
                    onTap: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search), label: 'Search'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: 'Profile'),
                    ],
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey[600],
                    showUnselectedLabels: false,
                  ))),
        )
      ],
    ));
  }
}
