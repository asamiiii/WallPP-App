import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaperapp/views/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Container(
          padding: const EdgeInsets.fromLTRB(25, 30, 0, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Get Premium ',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.greenAccent),
            ),
            const SizedBox(
              height: 5,
            ),
            brandName(),
          ]),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          )
        ],
        elevation: 0,
      ),
      body:screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: listOfNav,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        //selectedItemColor: Colors.amber[800],
        
      ),
    );
  }
}
