import 'package:flutter/material.dart';
import 'package:institutionapp/pages/home_page.dart';
import 'package:institutionapp/pages/item_register_page.dart';
import 'package:institutionapp/pages/legal_entities_profile_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentPageIndex = 0;
  List<Widget> body = [
    const HomePage(),
    ItemRegisterPage(),
    const LegalEntitiesProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
				currentIndex: currentPageIndex,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.percent_outlined),
              label: '',
          ),
        ],
      ),
    );
  }
}
