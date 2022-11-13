import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/wallpaper-model/wallpaper_model.dart';
import '../app_provider/provider.dart';
import '../views/fixed_data.dart';
import '../views/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_shimmer/flutter_shimmer.dart';

import 'cat_wallpaper_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    if (myProvider.pic.isEmpty) {
      myProvider.getCuratedPhotos(context);
    }

    myProvider.isFav = false;

    return Scaffold(
      body: myProvider.isLoadingShimmer
          ? const ProfilePageShimmer()
          : Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  categoryHomeText('Popular now'),
                  const SizedBox(height: 10), // Top separator
                  customSliderList(
                    context: context,
                    wallPapers: myProvider.pic,
                    imgWidth: 100,
                    imgHight: double.infinity,
                    listHight: 150,
                  ),

                  //const ImageMainSlider(),

                  const SizedBox(height: 20), // Bottom separator

                  categoryHomeText('Categories'),
                  const SizedBox(height: 10), // Top separator
                  categorySliderList(
                    context: context,
                    categoryList: catUrl,
                    categoryListLabel: catListText,
                    imgWidth: 180,
                    imgHight: 110,
                    listHight: 110,
                    //isCategory: true,
                  ),
                  const SizedBox(height: 20), // Bottom separator

                  categoryHomeText('Nowest'),
                  const SizedBox(height: 10), // Top separator
                  customSliderList(
                    context: context,
                    wallPapers: myProvider.pic,
                    imgWidth: 100,
                    imgHight: double.infinity,
                    listHight: 150,
                  ),
                ],
              ),
            ),
    );
  }
}
