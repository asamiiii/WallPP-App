import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'package:wallpaperapp/network/network.dart';
import 'package:wallpaperapp/views/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: listOfNav,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            print(selectedIndex);
          });
        },

        //selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
