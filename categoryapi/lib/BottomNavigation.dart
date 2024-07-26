import 'package:categoryapi/Category.dart';
import 'package:categoryapi/MyHomePage.dart';
import 'package:flutter/material.dart';

import 'PostsScreen.dart';
import 'User.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: index,
        onTap: (i){
          setState(() {
            index = i;
          });
        },

        selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_post_office),
              label: "Posts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "User",
            ),
          ]
      ),
        body: (index == 0)?MyHomePage():(index == 1)?CategoryPage():(index == 2)?PostsScreen():User()
      );
  }
}
