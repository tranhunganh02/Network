import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {


  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _currentPageIndex,
      onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.settings)),
            label: 'Setting',
          ),
        ],
       
      );
  }
}