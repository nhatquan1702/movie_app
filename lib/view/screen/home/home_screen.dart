import 'package:flutter/material.dart';
import 'package:movie_app/constant/theme/string.dart';
import 'package:movie_app/view/screen/home/widget/account_tab.dart';
import 'package:movie_app/view/screen/home/widget/download_tab.dart';
import 'package:movie_app/view/screen/home/widget/explore_tab.dart';
import 'package:movie_app/view/screen/home/widget/follow_tab.dart';
import 'package:movie_app/view/screen/home/widget/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTabLayout(),
    ExploreTab(),
    FollowTab(),
    DownloadTab(),
    AccountTab(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool _secureMode = false;

    return Container(
      color: theme.backgroundColor,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: theme.backgroundColor,
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: Theme(
            data: theme.copyWith(
              canvasColor: theme.backgroundColor,
              primaryColor: theme.primaryColor,
            ),
            child: BottomNavigationBar(
              elevation: 0,
              selectedFontSize: 16,
              unselectedFontSize: 16,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: ConstantString.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  label: ConstantString.explore,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_add_outlined),
                  label: ConstantString.follow,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_download_outlined),
                  label: ConstantString.download,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: ConstantString.account,
                ),
              ],
              selectedItemColor: theme.primaryColor,
              unselectedItemColor: theme.canvasColor.withOpacity(0.5),
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
