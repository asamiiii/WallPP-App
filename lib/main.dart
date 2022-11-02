import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'network/network.dart';
import 'views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => Provider_St(),
        child: Consumer<Provider_St>(
          builder: (context, value, child) {
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
          },
        ));
  }
}
