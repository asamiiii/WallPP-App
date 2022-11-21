import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/views/widgets.dart';
import '../../app_provider/provider.dart';
//import 'package:gallery_saver/gallery_saver.dart';

class SetWallScreen extends StatelessWidget {
  String picUrl;
  String? photographer;
 
  SetWallScreen({Key? key, required this.picUrl, this.photographer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    //myProvider.favButtonToggle(myProvider.isFav);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 600,
                width: double.infinity,
                child: Stack(children: [
                  CachedNetworkImage(
                    imageUrl: picUrl,
                    placeholder: (context, url) =>
                        const ProfilePageShimmer(isRectBox: false),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                   Positioned(
                    bottom: 20,
                    left: 80,
                    child: IconButton(
                                  onPressed: () {
                                    myProvider.saveNetworkImage(picUrl);
                                    myProvider.downloadButtonToggle();
                                  },
                                  icon: Image.asset(
                                    'assets/images/inbox-in.png',
                                    color: myProvider.isDownladed
                                        ? Colors.blueAccent
                                        : Colors.white,
                                    width: 30,
                                    height: 30,
                                  ),
                                  iconSize: 50),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 20,
                              child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.share),
                                    iconSize: 30),
                            ),
                            
                            Positioned(
                              left: 20,
                              bottom: 90,
                              child: IconButton(
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
                                  icon: myProvider.favSavedLocalList!
                                          .contains(picUrl)
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        )),
                            ),
                                Positioned(
                                  
                                  bottom: 20,
                                  right: 20,
                                  child: TextButton(child: const Text('Set as Wallpaper',style: TextStyle(fontSize: 16),),
                                  onPressed: (){},
                                  ))
                          ],
                        ),
                      
                    ),
                  ),
                
              
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.black12,
                  ),
                  width: double.infinity,
                  child: Text('Photographer : $photographer '),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
