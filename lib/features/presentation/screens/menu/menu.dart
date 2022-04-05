import 'package:flutter/material.dart';
import 'package:wallet_ui/core/styles.dart';
import 'package:wallet_ui/features/presentation/screens/main/main_screen/main_screen.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var currentIndex = 0;
  var screens = [
    MainScreen(),
    MainScreen(),
    MainScreen(),
    MainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Styles.textColor,
        currentIndex: currentIndex,
        unselectedIconTheme: IconThemeData(color: Styles.iconColor),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "главная",
            backgroundColor: Styles.backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_rounded,
            ),
            label: "Платежи",
            backgroundColor: Styles.backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.access_time_filled_sharp,
            ),
            label: "История",
            backgroundColor: Styles.backgroundColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
            ),
            label: "Ещё",
            backgroundColor: Styles.backgroundColor,
          ),
        ],
        onTap: (index) {
          setState(
            () => currentIndex = index,
          );
        },
      ),
    );
  }
}
