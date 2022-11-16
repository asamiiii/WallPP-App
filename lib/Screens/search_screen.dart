import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../app_provider/provider.dart';
import '../views/widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  static String routName = 'searchScreen';
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    //myProvider.searchPhoto(myProvider.searchText);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 70, left: 10, right: 10),
          child: Column(children: [
            SizedBox(
              width: double.infinity,
              child: TextField(
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    myProvider.searchPhoto(value);
                  }
                },
                onChanged: (value) {
                  if (value.isEmpty) {
                    myProvider.clearSearchText();
                    myProvider.searchList.clear();
                  }
                  print(value);
                },
                controller: searchController,
                style: const TextStyle(color: Colors.black),
                enabled: true,
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'Search for any Photo',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  enabled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            searchController.text.isEmpty
                ? searchAnimatedImage()
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
