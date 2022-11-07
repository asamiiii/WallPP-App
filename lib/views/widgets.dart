import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wallpaperapp/Screens/cat_wallpaper_view_screen.dart';
import 'package:wallpaperapp/Screens/fav_screen.dart';
import 'package:wallpaperapp/Screens/home_screen.dart';
import 'package:wallpaperapp/Screens/pic_full_screen.dart';
import 'package:wallpaperapp/Screens/search_screen.dart';
import 'package:wallpaperapp/Screens/set_wall_screen.dart';
import 'package:wallpaperapp/Screens/settings_screen.dart';
import 'package:wallpaperapp/views/fixed_data.dart';
import 'package:wallpaperapp/wallpaper-model/wallpaper_model.dart';
import 'package:shimmer/shimmer.dart';

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    flexibleSpace: Container(
      padding: const EdgeInsets.fromLTRB(25, 30, 0, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Get Premium ',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.greenAccent),
        ),
        const SizedBox(
          height: 5,
        ),
        brandName(),
      ]),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SearchScreen()));
                    }
        )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SettingsScreen()));
          },
        ),
      ),],
    elevation: 0,
  );
}

PreferredSizeWidget categoryScreensAppBar(String catTitle) {
  return AppBar(
    elevation: 0,
    title: Text(catTitle,
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black)),
  );
}

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

//List list1 = Provider_St().url;

Widget customSliderList(
    //Slider Fun
    {required List<WallpaperModel> wallPapers,
    BuildContext? context,
    double? imgWidth,
    double? imgHight,
    double? listHight}) {
  return Expanded(
    child: SizedBox(
        width: double.infinity,
        height: listHight,
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: ((context, index) => const SizedBox(
                width: 10,
              )),
          itemBuilder: ((context, index) => InkWell(
              onTap: (() => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FullScreen(
                        url: wallPapers[index].src!.original,
                      )))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(children: [
                  CachedNetworkImage(
                      imageUrl: wallPapers[index].src!.medium,
                      placeholder: (context, url) => const Center(
                          widthFactor: 10,
                          heightFactor: 10,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: imgWidth,
                      height: imgHight,
                      fit: BoxFit.cover),
                ]),
              ))),
          itemCount: wallPapers.length,
          scrollDirection: Axis.horizontal,
        )),
  );
}

Widget photoWidget(
    {required List<WallpaperModel> photo,
    required int index,
    required BuildContext context}) {
  return InkWell(
      onTap: (() => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FullScreen(
                url: photo[index].src!.original,
              )))),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(fit: StackFit.expand, children: [
          CachedNetworkImage(
            imageUrl: photo[index].src!.medium,
            placeholder: (context, url) => const Center(
                widthFactor: 10,
                heightFactor: 10,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            fit: BoxFit.cover,
          ),
        ]),
      ));
}

Widget categorySliderList(
    //Slider Fun
    {required List<String> categoryList,
    required List<String> categoryListLabel,
    BuildContext? context,
    double? imgWidth,
    double? imgHight,
    double? listHight}) {
  return SizedBox(
    width: double.infinity,
    height: listHight,
    child: ListView.separated(
      shrinkWrap: true,
      separatorBuilder: ((context, index) => const SizedBox(
            width: 10,
          )),
      itemBuilder: ((context, index) => InkWell(
          onTap: () => navigateTo(
              context: context,
              newScreen: WallpapersViewScreen(
                title: categoryListLabel[index],
              )),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(children: [
              CachedNetworkImage(
                  imageUrl: categoryList[index],
                  placeholder: (context, url) => const Center(
                      widthFactor: 10,
                      heightFactor: 10,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: imgWidth,
                  height: imgHight,
                  fit: BoxFit.fill),
              Container(
                alignment: Alignment.topCenter,
                color: Colors.black54.withOpacity(0.3),
                width: imgWidth,
                height: 50,
                child: Center(
                  child: Text(
                    categoryListLabel[index],
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              )
            ]),
          ))),
      itemCount: categoryList.length,
      scrollDirection: Axis.horizontal,
    ),
  );
}

Widget setWallSliderList(
    //Slider Fun
    {
  String? url,
  double? imgWidth,
  double? imgHight,
}) {
  return ClipRRect(
      //borderRadius: BorderRadius.circular(10),
      child: Stack(children: [
    CachedNetworkImage(
      imageUrl: url!,
      placeholder: (context, url) => const Center(
          widthFactor: 10,
          heightFactor: 10,
          child: CircularProgressIndicator(
            strokeWidth: 1,
          )),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      width: imgWidth,
      height: imgHight,
      fit: BoxFit.cover,
    ),
    Container(
      width: imgWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.event_note_rounded),
                  iconSize: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 40),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.share), iconSize: 30),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.download_for_offline_outlined),
                iconSize: 50,
              ),
            ],
          ),
        ],
      ),
    )
  ]));
}

List<BottomNavigationBarItem> listOfNav = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home_filled),
    label: '',
  ),
  const BottomNavigationBarItem(icon: Icon(Icons.vibration_rounded), label: ''),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
];

List<Widget> screens = [
  const HomeScreen(),
  const SetWallScreen(),
  const FavScreen(),
];

navigateTo({required Widget newScreen, required BuildContext context}) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => newScreen));
}

Widget shimmer() {
  return Shimmer.fromColors(
      child: Container(
        width: 300,
        height: 400,
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 100,
                    width: 50,
                  )
                ],
              );
            },
            itemCount: 3),
      ),
      baseColor: Colors.white12,
      highlightColor: Colors.black54);
}
