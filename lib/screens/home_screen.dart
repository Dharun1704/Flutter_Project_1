import 'package:flutter/material.dart';
import 'package:induction_21_task1/screens/lorrentz_screen.dart';
import 'package:induction_21_task1/screens/practice_screen.dart';
import 'package:induction_21_task1/screens/spi_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  PageController _pageController = new PageController();
  List<Widget> _screens = [
    LorrentzScreen(),
    PracticeScreen(),
    SpiScreen()
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
            fontFamily: 'Volte'
        ),
        unselectedLabelStyle: TextStyle(
            fontFamily: 'Volte'
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school_rounded),
            label: 'Factor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension_rounded),
            label: 'Practice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pest_control_outlined),
            label: 'SPI',
          ),
        ],
        backgroundColor: Colors.yellow,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[900],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
