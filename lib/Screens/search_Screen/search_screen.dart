import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:wallpaperapp/Screens/search_Screen/widget.dart';
import '../../app_provider/provider.dart';
import '../../views/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static String routName = 'searchScreen';
  //TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
            const SearchTextField(),
            const SizedBox(
              height: 20,
            ),
            myProvider.searchController.text.isEmpty
                ? searchImageIcon()
                : Expanded(
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      staggeredTileBuilder: (index) {
                        return StaggeredTile.count(1, index.isEven ? 1.2 : 1.9);
                      },
                      itemCount: myProvider.searchList.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                            child: photoWidget(
                          photo: myProvider.searchList,
                          index: index,
                          context: context,
                        ));
                      },
                    ),
                  ),
          ]),
        ));
  }
}
