import 'package:fashionapp/app/home_screeen.dart';
import 'package:fashionapp/app/settings_screen.dart';
import 'package:flutter/material.dart';

import 'favorite_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() =>  _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //menu index selected
  int selectedIndex = 0;

  //List of the menu screens
  List _screens = [HomeScreen(), FavoriteScreen(), SettingsScreen()];

  //Function to update menu index
  void updateMenuIndex(int index) {
    setState(() {
      selectedIndex = index;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
            icon: Icon(Icons.home,
                color: Colors.black, size: 36)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          PopupMenuButton<int>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 32,
              ),
              color: Colors.purple.shade50,
              offset: Offset(0, 45),
              enabled: true,
              tooltip: "Menu",
              onSelected: (value) {
                print("value:$value ");
              },
              onCanceled: () {
                print("value is cancled");
              },
              itemBuilder: (BuildContext Context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Text("item 1"),
                    onTap: () {
                      print("item 1 is clicked");
                    },
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    value: 2,
                    child: Text("item 2"),
                    onTap: () {
                      print("item 2 is clicked ");
                    },
                  )
                ];
              })
        ],
      ),
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: updateMenuIndex,
          selectedItemColor: Color(0xffAA78E9),
          type: BottomNavigationBarType.fixed,
          items: [
            bottomNavBar(
                icon: Icons.home_outlined,
                lable: 'Home',
                iconAction: Icons.home),
            bottomNavBar(
                icon: Icons.favorite_border,
                lable: 'Favorite',
                iconAction: Icons.favorite),
            bottomNavBar(
                icon: Icons.settings_suggest_outlined,
                lable: 'Settings',
                iconAction: Icons.settings_suggest),
          ]),
    );
  }

  bottomNavBar(
      {required IconData icon,
      required String lable,
      required IconData iconAction}) {
    return BottomNavigationBarItem(
        icon: Icon(icon), label: lable, activeIcon: Icon(iconAction));
  }
}
