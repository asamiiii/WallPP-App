import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/wallpaper-model/wallpaper_model.dart';
import '../network/network.dart';
import '../views/fixed_data.dart';
import '../views/widgets.dart';
import 'package:http/http.dart' as http;

import 'cat_wallpaper_view_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              categoryHomeText('Popular now'),
              const SizedBox(height: 10), // Top separator
              customSliderList(
                  context: context,
                  wallPapers: pic,
                  imgWidth: 160,
                  imgHight: 250,
                  listHight: 250,
                  ),

              const SizedBox(height: 20), // Bottom separator

              categoryHomeText('Categories'),
              const SizedBox(height: 10), // Top separator
              categorySliderList(
                nextScreen: const WallpapersViewScreen(),
                  context: context,
                  categoryList: catUrl,
                  categoryListLabel: catListText,
                  imgWidth: 220,
                  imgHight: 150,
                  listHight: 150,
                  //isCategory: true,
                  ),
              const SizedBox(height: 20), // Bottom separator

              categoryHomeText('Nowest'),
              const SizedBox(height: 10), // Top separator
              customSliderList(
                  wallPapers: pic,
                  imgWidth: 160,
                  imgHight: 250,
                  listHight: 250,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

late List<WallpaperModel> pic = [];
getCuratedPhotos() async {
  var url = Uri.parse('https://api.pexels.com/v1/curated?per_page=10');
  var response = await http.get(url, headers: {
    "Authorization": '563492ad6f91700001000001acf6db0cbfbe46c8a45f6df76562cc52'
  });

  //print(response.body);

  Map<String, dynamic> jsonData = jsonDecode(response.body);

  //parsing data
  jsonData["photos"].forEach((element) {
    // print(element); // dev mode
    // getting data
    WallpaperModel wallpaperModel = new WallpaperModel();
    wallpaperModel = WallpaperModel.fromMap(element);
    pic.add(wallpaperModel);
    print(pic[0].src!.portrait);
  });
}

late List<WallpaperModel> catPic = [];
getCategoryPhotos(String searchOrCat) async {
  var url = Uri.parse('https://api.pexels.com/v1/search?query=$searchOrCat&per_page=1');
  var response = await http.get(url, headers: {
    "Authorization": '563492ad6f91700001000001acf6db0cbfbe46c8a45f6df76562cc52'
  });

  //print(response.body);

  Map<String, dynamic> jsonData = jsonDecode(response.body);

  //parsing data
  jsonData["photos"].forEach((element) {
    // print(element); // dev mode
    // getting data
    WallpaperModel wallpaperModel = new WallpaperModel();
    wallpaperModel = WallpaperModel.fromMap(element);
    catPic.add(wallpaperModel);
    print(catPic[0].src!.portrait);
  });
}
