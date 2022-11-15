import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/style/app_colors.dart';
import 'package:movie_app/features/account/presenter/page/account_page.dart';
import 'package:movie_app/features/home/presenter/page/home_page.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 2: Coming',
    ),
    Text(
      'Index 3: Account',
    ),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
            child: BottomNavigationBar(
              selectedItemColor: AppColors.lightBlue,
              unselectedItemColor: AppColors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.slow_motion_video),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.airplane_ticket),
                  label: 'Discover',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_rounded),
                  label: 'Coming',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Account',
                ),
              ],
              currentIndex: _selectedIndex,
              // selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            ),
        )
    );
  }
}