import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Screens/set_wall_screen.dart';
import 'package:wallpaperapp/local/cashe_helper.dart';
import 'package:wallpaperapp/views/widgets.dart';
import '../app_provider/provider.dart';




class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    print(myProvider.favSavedLocalList);
    return GridView.builder(
      itemCount: myProvider.favSavedLocalList!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SetWallScreen(
                        picUrl: myProvider.returnUrlLocal(index).toString()),
                  ));
                },
                child: CachedNetworkImage(
                    imageUrl: myProvider.returnUrlLocal(index),
                    placeholder: (context, url) => const Center(
                        widthFactor: 10,
                        heightFactor: 10,
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        )),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover),
              ),
            ),
            IconButton(
                onPressed: () {
                  myProvider.removeURlFromLocal(index);
                  showToast('تم الحذف !!');
                  print(myProvider.favPicList);
                },
                icon: myProvider.isFav
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.blue,
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
          ],
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1.25),
      ),
    );
  }
}
