import 'package:flutter/material.dart';

import 'views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: 
        
        const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black38),),
          iconTheme: const IconThemeData(color: Colors.white)
        //primarySwatch: Colors.lime,
      ),
      home: Home(),
    );
  }
}



