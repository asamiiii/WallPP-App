import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'package:wallpaperapp/Screens/shimer_loading_screen.dart';
import 'package:wallpaperapp/views/widgets.dart';

import '../network/network.dart';
import '../views/fixed_data.dart';
import '../wallpaper-model/wallpaper_model.dart';

class WallpapersViewScreen extends StatelessWidget {
  final String title;
  WallpapersViewScreen({Key? key, required this.title})
      : super(key: key);

      

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    
    if (myProvider.islamicCatPic.isEmpty&&title==catListText[0]) {
        myProvider.getIslamicPhotos();
    }
    if (myProvider.computerCatPic.isEmpty&&title==catListText[1]) {
      myProvider.getComputerPhotos();
    }
    if (myProvider.darkCatPic.isEmpty&&title==catListText[2]) {
      myProvider.getDarkPhotos();
    }
    if (myProvider.sunsetCatPic.isEmpty&&title==catListText[3]) {
      myProvider.getSunsetPhotos();
    }
    return Scaffold(
      appBar: categoryScreensAppBar(title),
      body: GridView.builder(
        itemCount:title==catListText[0]?myProvider.islamicCatPic.length:
                        title==catListText[1]?myProvider.computerCatPic.length:
                        title==catListText[2]?myProvider.darkCatPic.length:
                        myProvider.sunsetCatPic.length,
        itemBuilder: (context, index) {
          return SizedBox(
              child: photoWidget(
                  photo:title==catListText[0]?myProvider.islamicCatPic:
                        title==catListText[1]?myProvider.computerCatPic:
                        title==catListText[2]?myProvider.darkCatPic:
                        myProvider.sunsetCatPic
                         ,
                  index: index,
                  context: context,
                  ));
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.25),
        ),
      ),
    );
  }
}
