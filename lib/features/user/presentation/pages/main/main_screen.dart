// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:event_app/features/user/presentation/pages/manage/manage_screen.dart';
import 'package:flutter/material.dart';

import 'package:event_app/features/user/data/models/account.dart';
import 'package:event_app/features/user/presentation/pages/main/home/home_page.dart';
import 'package:event_app/features/user/presentation/pages/main/profile/profile_page.dart';
import 'package:event_app/features/user/presentation/pages/main/search/search_page.dart';

class MainScreen extends StatefulWidget {
  final Account account;
  const MainScreen({
    Key? key,
    required this.account,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static String role = '';
  String getRole() => role;

  @override
  void initState() {
    super.initState();
    role = widget.account.role;

  }

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
  String role = _MainScreenState().getRole();
  bool isAdmin = false;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    isAdmin = role.compareTo('admin') == 0;
    pages = !isAdmin
        ? <Widget>[
            const HomeScreen(),
            const SearchScreen(),
            const ProfileScreen(),
          ]
        : <Widget>[
            const HomeScreen(),
            const SearchScreen(),
            const ManageScreen(),
            const ProfileScreen(),
          ];
  }

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
                    items: !isAdmin
                        ? const [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.home), label: 'Home'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.search), label: 'Search'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.person), label: 'Profile'),
                          ]
                        : const [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.home), label: 'Home'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.search), label: 'Search'),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.manage_accounts),
                                label: 'Manage'),
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
