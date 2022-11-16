import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/views/widgets.dart';
import '../app_provider/provider.dart';
import '../views/fixed_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallpapersViewScreen extends StatelessWidget {
  final String title;
  const WallpapersViewScreen({Key? key, required this.title}) : super(key: key);
  static String routName = 'WallpapersViewScreen';

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);

    if (myProvider.islamicCatPic.isEmpty && title == catListText[0]) {
      myProvider.getIslamicPhotos();
    }
    if (myProvider.computerCatPic.isEmpty && title == catListText[1]) {
      myProvider.getComputerPhotos();
    }
    if (myProvider.darkCatPic.isEmpty && title == catListText[2]) {
      myProvider.getDarkPhotos();
    }
    if (myProvider.sunsetCatPic.isEmpty && title == catListText[3]) {
      myProvider.getSunsetPhotos();
    }
    return Scaffold(
      appBar: categoryScreensAppBar(title),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index.isEven ? 1.5 : 1.8);
        },
        itemCount: title == catListText[0]
            ? myProvider.islamicCatPic.length
            : title == catListText[1]
                ? myProvider.computerCatPic.length
                : title == catListText[2]
                    ? myProvider.darkCatPic.length
                    : myProvider.sunsetCatPic.length,
        itemBuilder: (context, index) {
          return SizedBox(
              child: photoWidget(
            photo: title == catListText[0]
                ? myProvider.islamicCatPic
                : title == catListText[1]
                    ? myProvider.computerCatPic
                    : title == catListText[2]
                        ? myProvider.darkCatPic
                        : myProvider.sunsetCatPic,
            index: index,
            context: context,
          ));
        },
      ),
    );
  }
}
