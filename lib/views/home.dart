import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'package:wallpaperapp/network/network.dart';
import 'package:wallpaperapp/views/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
     final myProvider = Provider.of<Provider_St>(context);
    return Scaffold(
      appBar: appBar(context),
      body: screens[myProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: listOfNav,
        currentIndex: myProvider.selectedIndex,
        onTap: (int index){
          myProvider.bottomNavToggle(index);
        }
        //selectedItemColor: Colors.amber[800],
      )
    );
  }
}
