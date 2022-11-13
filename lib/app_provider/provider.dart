import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:gallery_saver/gallery_saver.dart';
//import 'package:gallery_saver/gallery_saver.dart';
import 'package:http/http.dart' as http;
import '../local/cashe_helper.dart';
import '../views/widgets.dart';
import '../wallpaper-model/wallpaper_model.dart';

class Provider_St extends ChangeNotifier {
  late List<WallpaperModel> pic = [];

  late List<WallpaperModel> islamicCatPic = [];
  late List<WallpaperModel> computerCatPic = [];
  late List<WallpaperModel> darkCatPic = [];
  late List<WallpaperModel> sunsetCatPic = [];

  List<String> favPicList = [];

  List<String>? favSavedLocalList =
      CasheHelper.getListOfUrl(key: 'favoriteList') ?? [];

  // Saving URL to List of string in Shared Pref
  savingUrlToLocalList(String fav) {
    favSavedLocalList!.add(fav);
    CasheHelper.putListOfUrl(key: 'favoriteList', value: favSavedLocalList!);
    notifyListeners();
  }

  // Get URL from List of string in Shared Pref
  returnUrlLocal(int index) {
    String x = favSavedLocalList![index];
    //notifyListeners();
    return x;
  }

  // remove Specifice item in the List of string in Shared Pref
  removeURlFromLocal(int index) {
    favSavedLocalList!.removeAt(index);
    CasheHelper.putListOfUrl(key: 'favoriteList', value: favSavedLocalList!);
    notifyListeners();
  }

  int selectedIndex = 0;
  bool isLoadingShimmer = false;
  bool isFav = false;

  bottomNavToggle(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  saveNetworkImage(String path) {
    showToast('يتم التحميل .. برجاء الانتظار');
    GallerySaver.saveImage(
      path,
      albumName: 'WallPP',
    ).then((value) {
      if(value==true){
        showToast('تم التحميل ');
      }
    });

    notifyListeners();
    
  }

  favButtonToggle(isFavo) {
    isFavo ? isFav = false : isFav = true;
    print(isFav);
    notifyListeners();
  }

  getPicUrlByIndexOfList() {
    for (var picUrl in favPicList) {
      favPicList.remove(picUrl);
      notifyListeners();
    }
  }

  isFavSearchIfItemExist(String x, bool isFav) {
    for (int i = 0; i < favPicList.length; i++) {
      if (x == favPicList[i]) {
        isFav = false;
        favPicList.remove(favPicList[i]);
        notifyListeners();
      } else {
        isFav = true;
        favPicList.add(favPicList[i]);
        notifyListeners();
        return x;
      }
    }
  }

  getCuratedPhotos(BuildContext context) async {
    isLoadingShimmer = true;
    isFav = false;
    var url = Uri.parse('https://api.pexels.com/v1/curated?per_page=80');
    var response = await http.get(url, headers: {
      "Authorization":
          '563492ad6f91700001000001acf6db0cbfbe46c8a45f6df76562cc52',
    });

    //print(response.body);

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    //parsing data
    jsonData["photos"].forEach((element) {
      // print(element); // dev mode
      // getting data
      WallpaperModel wallpaperModel = WallpaperModel();

      wallpaperModel = WallpaperModel.fromMap(element);
      pic.add(wallpaperModel);
      isLoadingShimmer = false;
      notifyListeners();
    });
  }

  getIslamicPhotos() async {
    //catPic=[];
    var url =
        Uri.parse('https://api.pexels.com/v1/search?query=islamic&per_page=10');
    var response = await http.get(url, headers: {
      "Authorization":
          '563492ad6f91700001000001acf6db0cbfbe46c8a45f6df76562cc52',
    });

    //print(response.body);

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) async {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      islamicCatPic.add(wallpaperModel);
      notifyListeners();
      print(islamicCatPic.length);
    });
  }

  getComputerPhotos() async {
    //catPic=[];
    var url = Uri.parse(
        'https://api.pexels.com/v1/search?query=Computer&per_page=30');
    var response = await http.get(url, headers: {
      "Authorization":
          '563492ad6f91700001000001acf6db0cbfbe46c8a45f6df76562cc52',
    });

    //print(response.body);

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      computerCatPic.add(wallpaperModel);
      notifyListeners();
      print(computerCatPic.length);
    });
  }

  getDarkPhotos() async {
    //catPic=[];
    var url =
        Uri.parse('https://api.pexels.com/v1/search?query=dark&per_page=10');
    var response = await http.get(url, headers: {
      "Authorization":
          '563492ad6f91700001000001acf6db0cbfbe46c8a45f6df76562cc52',
    });

    //print(response.body);

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      darkCatPic.add(wallpaperModel);
      notifyListeners();
      print(darkCatPic.length);
    });
  }

  getSunsetPhotos() async {
    //catPic=[];
    var url =
        Uri.parse('https://api.pexels.com/v1/search?query=sunset&per_page=10');
    var response = await http.get(url, headers: {
      "Authorization":
          '563492ad6f91700001000001acf6db0cbfbe46c8a45f6df76562cc52',
    });

    //print(response.body);

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      sunsetCatPic.add(wallpaperModel);
      notifyListeners();
      print(sunsetCatPic.length);
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
