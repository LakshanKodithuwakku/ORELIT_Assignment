import 'package:flutter/material.dart';
import 'package:orelit_assignment/constants/colors.dart';

class BotomNavBar extends StatelessWidget {
  final selectedIndex;
  ValueChanged<int> onItemTapped;
  BotomNavBar({Key? key, this.selectedIndex, required this.onItemTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Science',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervisor_account_outlined),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Technology',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: backgroundYellow,
      onTap: onItemTapped,
    );
  }
}
