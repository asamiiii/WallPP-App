import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'package:wallpaperapp/views/widgets.dart';

import '../views/fixed_data.dart';
import '../wallpaper-model/wallpaper_model.dart';

class WallpapersViewScreen extends StatefulWidget {
  const WallpapersViewScreen({Key? key}) : super(key: key);

  @override
  State<WallpapersViewScreen> createState() => _WallpapersViewScreenState();
}

class _WallpapersViewScreenState extends State<WallpapersViewScreen> {
  @override
  void initState() {
    //catPic = [];
    WidgetsFlutterBinding.ensureInitialized();
    
    if(catPic.isEmpty)
    {
      getCategoryPhotos('Islamic');
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: appBar(),
      body: GridView.builder(
        itemCount: catPic.length,
        itemBuilder: (context, index) {
          return SizedBox(
              child: photoWidget(
                  photo: catPic,
                  index: index,
                  context: context,
                  newScreen: const HomeScreen()));
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

late List<WallpaperModel> catPic=[] ;
getCategoryPhotos(String searchOrCat) async {
  //catPic=[];
  var url = Uri.parse(
      'https://api.pexels.com/v1/search?query=$searchOrCat&per_page=10');
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
