import 'package:flutter/material.dart';
import 'package:flutter_final_network/constanst.dart';
import '../chat/list_chat_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
 
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    ListChat(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 1.2,
        title: const Text("Chat app"),
        backgroundColor: kSecondPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: kPrimaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.white,
          onPressed: () {},
          child: const Icon(
            Icons.group_add_outlined,
            color: Colors.black,
            size: 30,
          )),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }

  BottomNavigationBar BottomBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Setting',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: kSecondPrimaryColor,
      unselectedItemColor: Color.fromARGB(255, 70, 69, 65),
      onTap: _onItemTapped,
    );
  }
}
