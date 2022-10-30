import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../wallpaper-model/wallpaper_model.dart';

class Provider_St extends ChangeNotifier {
  Map<String, dynamic> rondomPic = {};
  late List<WallpaperModel> pic = [];

  getCuratedPhotos(BuildContext context) async {
    var url = Uri.parse('https://api.pexels.com/v1/curated?per_page=10');
    var response = await http.get(url, headers: {
      "Authorization":
          '563492ad6f91700001000001acf6db0cbfbe46c8a45f6df76562cc52'
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
      notifyListeners();

      print(pic[0].src!.portrait);
    });
  }

  int counter = 0;

  addCounter() {
    counter += 1;
    notifyListeners();
  }
}

class PhotoModel extends Provider_St {
  int? id;
  Map? src;
  String? photographer;

  PhotoModel({this.id, this.src, this.photographer});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
    photographer = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = id;
    data['price'] = src;
    data['category'] = photographer;
    return data;
  }
}
  /// Makes `Counter` readable inside the devtools by listing all of its properties
  /*  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  */
