import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.of(context).pop();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        //fixedColor: Colors.redAccent,
        // backgroundColor: Colors.blue,
        // unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.search),
          //     label: 'search'.tr,
          //     backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Aboout',
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        iconSize: 20,
        onTap: _onItemTapped,
        elevation: 1);
  }
}
