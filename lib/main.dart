import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Screens/search_Screen/search_screen.dart';
import 'package:wallpaperapp/local/cashe_helper.dart';
import 'app_provider/provider.dart';
import 'views/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.init();
  runApp(const MyApp());
  MaterialApp(
    initialRoute: Home.routeName,
    routes: {
      SearchScreen.routName:(_) =>  const SearchScreen(),
      Home.routeName:(context) =>  Home()
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
