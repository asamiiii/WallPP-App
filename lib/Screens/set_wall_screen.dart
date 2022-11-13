import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaperapp/local/cashe_helper.dart';
import 'package:wallpaperapp/views/widgets.dart';
import '../app_provider/provider.dart';
//import 'package:gallery_saver/gallery_saver.dart';

class SetWallScreen extends StatelessWidget {
  String picUrl;
  SetWallScreen({Key? key, required this.picUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    //myProvider.favButtonToggle(myProvider.isFav);
    return Scaffold(
      body: SizedBox(
        //padding: const EdgeInsets.all(8),
        height: double.infinity,
        width: double.infinity,
        child: Stack(children: [
          CachedNetworkImage(
            imageUrl: picUrl,
            placeholder: (context, url) =>
                const ProfilePageShimmer(isRectBox: false),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          myProvider.saveNetworkImage(picUrl);
                          //showToast();
                        },
                        icon: const Icon(Icons.file_download_outlined),
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
                        onPressed: () {
                          myProvider.favButtonToggle(myProvider.isFav);
                          if (myProvider.isFav == true) {
                            myProvider.savingUrlToLocalList(picUrl);
                            showToast('تم الاضافه في قائمة المفضلات');
                            print(myProvider.favPicList);
                          } else {
                            myProvider.favPicList.remove(picUrl);
                          }
                        },
                        icon: myProvider.isLoadingShimmer
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              )
                            : myProvider.isFav
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ))
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
