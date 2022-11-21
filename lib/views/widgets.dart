import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaperapp/Screens/category_screen/cat_wallpaper_view_screen.dart';
import 'package:wallpaperapp/Screens/favorite_screen/fav_screen.dart';
import 'package:wallpaperapp/Screens/home_screen/home_screen.dart';
import 'package:wallpaperapp/Screens/search_Screen/search_screen.dart';
import 'package:wallpaperapp/Screens/wallpaper_fullScreen.dart/set_wall_screen.dart';
import 'package:wallpaperapp/wallpaper-model/wallpaper_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../app_provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Navigator.pushNamed(context, SearchScreen.routName);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        )
      ],
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
}

PreferredSizeWidget appBar(BuildContext c) {
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
            navigateTo(newScreen: SearchScreen(), context: c);
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        ),
      )
    ],
    elevation: 0,
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


Widget photoWidget(
    {required List<WallpaperModel> photo,
    required int index,
    required BuildContext context
    }) {
      final myProvider = Provider.of<Provider_St>(context);
  return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              SetWallScreen(picUrl: photo[index].src!.portrait,photographer: photo[index].photographer!),
        ));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
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
                  /*  placeholder: (context, url) => const Center(
                      widthFactor: 10,
                      heightFactor: 10,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      )), */
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

    {List<WallpaperModel>? list,
    double? imgWidth,
    double? imgHight,
    double? listHight,
    List<String>? catListText}) {
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
                child: Stack(children: [
                  CachedNetworkImage(
                    imageUrl: list![index].src!.original,
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
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.event_note_rounded),
                                iconSize: 50),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 40),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.share),
                                  iconSize: 30),
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
                ])))),
        itemCount: list!.length,
        scrollDirection: Axis.horizontal,
      ));
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
  const FavScreen(
  ),
  const FavScreen(),
];

navigateTo({required Widget newScreen, required BuildContext context}) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => newScreen));
}

Widget loadingShimmer() => Shimmer.fromColors(
      baseColor: Colors.grey,
      enabled: Provider_St().isLoadingShimmer,
      highlightColor: Colors.grey[400]!,
      period: const Duration(seconds: 3),
      child: Container(
          //decoration: BoxDecoration(border: Border.all()),
          child: const SizedBox(
        height: double.infinity,
        width: double.infinity,
      )),
    );

showToast(String x) {
  Fluttertoast.showToast(
      msg: x,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black45,
      textColor: Colors.white);
}

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


