import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'package:wallpaperapp/network/network.dart';
import 'package:wallpaperapp/views/fixed_data.dart';

import '../views/widgets.dart';

class SetWallScreen extends StatelessWidget {
  const SetWallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Provider_St(),
        child: Consumer<Provider_St>(
          builder: (context, value, child) => Container(
            padding: EdgeInsets.all(8),
            height: double.infinity,
            width: double.infinity,
            child: setWallSliderList(
                listHight: double.infinity,
                imgHight: double.infinity,
                imgWidth: 400,
                list: value.pic),
          ),
        ));
  }
}
