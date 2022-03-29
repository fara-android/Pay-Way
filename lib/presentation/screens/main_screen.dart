import 'package:flutter/material.dart';
import 'package:wallet_ui/presentation/screens/history_screen/history_screen.dart';
import 'package:wallet_ui/presentation/screens/home_screen/home_screen.dart';
import 'package:wallet_ui/presentation/screens/more_screen/more_screen.dart';
import 'package:wallet_ui/presentation/screens/payments_screen/payments_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static final String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List _pages = [
    HomeScreen(),
    PaymentsScreen(),
    HistoryScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Color(0xff022635),
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Color(0xff022635),
            textTheme: Theme
                .of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))), // sets the inactive color of the `BottomNavigationBar`
        child:  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xff1A4B6D),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon:  Icon(Icons.home),
              label:  "Главная",
            ),
            BottomNavigationBarItem(
              icon:  Icon(Icons.account_balance_wallet),
              label:  "Платежи",
            ),

            BottomNavigationBarItem(
              icon:  Icon(Icons.access_time_filled),
              label:  "История",
            ),

            BottomNavigationBarItem(
              icon:  Icon(Icons.menu),
              label:  "Ещё",
            )
          ],
        ),
      ),
    );
  }
}
