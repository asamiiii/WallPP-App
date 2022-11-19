import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_provider/provider.dart';
import '../../views/widgets.dart';
import '../category_screen/cat_wallpaper_view_screen.dart';
import '../wallpaper_fullScreen.dart/set_wall_screen.dart';

Widget categoryHomeText(String mainCatTextInHome) {
  return SizedBox(
    child: Text(
      mainCatTextInHome,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
  );
}

class ImageMainSlider extends StatelessWidget {
  var photoList;
  ImageMainSlider({Key? key, this.photoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    //final myProvider = Provider.of<Provider_St>(context);
    if (myProvider.pic.isEmpty) {
      myProvider.getCuratedPhotos(context);
      //myProvider.getRandomPhotosUnsplash(context);
    }
    //print(myProvider.pic.length);
    return Expanded(
      child: SizedBox(
          width: double.infinity,
          height: 150,
          child: ListView.separated(
            //shrinkWrap: true,
            separatorBuilder: ((context, index) => const SizedBox(
                  width: 10,
                )),
            itemBuilder: ((context, index) => InkWell(
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SetWallScreen(
                        picUrl: myProvider.pic[index].src!.portrait,photographer: myProvider.pic[index].photographer!),
                  ));
                }),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                      imageUrl: myProvider.pic[index].src!.medium,
                      placeholder: (context, url) => const Center(
                          widthFactor: 10,
                          heightFactor: 10,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: 100,
                      height: double.infinity,
                      fit: BoxFit.cover),
                ))),
            itemCount: myProvider.pic.length,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}

class CategorySliderList extends StatelessWidget {
  final List<String> categoryList;
  final List<String> categoryListLabel;
  //BuildContext? context;
  final double? imgWidth;
  final double? imgHight;
  final double? listHight;

  const CategorySliderList(
      {Key? key,
      required this.categoryList,
      required this.categoryListLabel,
      this.imgWidth,
      this.imgHight,
      this.listHight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
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
}
