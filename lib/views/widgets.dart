import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaperapp/Screens/fav_screen.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'package:wallpaperapp/Screens/set_wall_screen.dart';

Widget brandName() {
  return SizedBox(
    child: RichText(
        text: const TextSpan(
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            children: <TextSpan>[
          TextSpan(text: 'WallPP ', style: TextStyle(color: Colors.black87)),
          TextSpan(text: 'App', style: TextStyle(color: Colors.blue)),
        ])),
  );
}

Widget categoryHomeText(String mainCatTextInHome) {
  return SizedBox(
    child: Text(
      mainCatTextInHome,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
  );
}



Widget customSliderList(              //Slider Fun 
    { List<String>? list,
     double? imgWidth,
     double? imgHight,
     double? listHight,
     bool? isCategory,
    List<String>?catListText}) {
  return SizedBox(
      width: double.infinity,
      height: listHight,
      child: ListView.separated(
        separatorBuilder: ((context, index) => const SizedBox(
              width: 10,
            )),
        itemBuilder: ((context, index) => InkWell(
            onTap: (() {}),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children:[CachedNetworkImage(
                    imageUrl: list![index],
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    width: imgWidth,
                    height: imgHight,
                    fit: BoxFit.fill,
                  ),
                  isCategory! ?  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                    child: Text(catListText![index],style: const TextStyle(fontSize: 35,color: Colors.white,),)):const Text('')] 
                )))),
        itemCount: list!.length,
        scrollDirection: Axis.horizontal,
      ));
}

Widget setWallSliderList(              //Slider Fun 
    { List<String>? list,
     double? imgWidth,
     double? imgHight,
     double? listHight,
    List<String>?catListText}) {
  return SizedBox(
      width: double.infinity,
      height: listHight,
      child: ListView.separated(
        separatorBuilder: ((context, index) => const SizedBox(
              width: 10,
            )),
        itemBuilder: ((context, index) => InkWell(
            onTap: (() {}),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children:[CachedNetworkImage(
                    imageUrl: list![index],
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    width: imgWidth,
                    height: imgHight,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    width: imgWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.event_note_rounded),iconSize: 50),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 40),
                              child: IconButton(onPressed: (){}, icon: Icon(Icons.share),iconSize: 30),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.download_for_offline_outlined),iconSize: 50,),
                          ],
                        ),
                      ],
                    ),
                  )]
                )))),
        itemCount: list!.length,
        scrollDirection: Axis.horizontal,
      ));
}




List<BottomNavigationBarItem> listOfNav = [
  const BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: '',),
  const BottomNavigationBarItem(icon: Icon(Icons.vibration_rounded), label: ''),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
];

List<Widget> screens = [
  const HomeScreen(),
  const SetWallScreen(),
  const FavScreen(),

];
