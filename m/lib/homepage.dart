import 'package:flutter/material.dart';
import 'package:ujikom/layout/dashboard.dart';
import 'package:ujikom/layout/profil.dart';
import 'package:ujikom/layout/user.dart';

class Home extends StatefulWidget {
  const Home() : super();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  static final List<Widget> screen = <Widget>[
    Dashboard(),
    Profil(),
    User(),
  ];
  void onTap(int index) {
    setState(() {
      currentTab = index;
      currentScreen = Dashboard();
    });
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: bucket, child: screen.elementAt(currentTab)),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          selectedFontSize: 12,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentTab,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                label: "Location",
                icon: Icon(Icons.location_on),
                activeIcon: Icon(Icons.location_on)),
            BottomNavigationBarItem(
                label: "Search Location",
                icon: Icon(Icons.cell_tower_outlined),
                activeIcon: Icon(Icons.cell_tower_outlined)),
            BottomNavigationBarItem(
              label: "Setting",
              icon: Icon(Icons.settings),
              activeIcon: Icon(Icons.settings),
            )
          ]),
    );
  }
}
