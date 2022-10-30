import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getCuratedPhotos();
  
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
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(color: Colors.black38),
          ),
          iconTheme: const IconThemeData(color: Colors.white)
          //primarySwatch: Colors.lime,
          ),
      home: Home(),
    );
  }
}
