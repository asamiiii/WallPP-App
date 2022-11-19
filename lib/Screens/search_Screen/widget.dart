import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../app_provider/provider.dart';

Widget searchImageIcon() {
  return Expanded(
    child: Image.asset(
      'assets/images/search.png',
      width: 200,
      height: 200,
    ),
  );
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<Provider_St>(context);
    return SizedBox(
      width: 300,
      child: TextField(
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            myProvider.searchPhoto(value);
          }
          print(myProvider.searchController.value.text);

          /* String x = 'Ahmed Sami' * 2;
                  print(x); */
        },
        onChanged: (value) {
          if (value.isEmpty) {
            myProvider.clearSearchText();
            myProvider.searchList.clear();
          }
          //print(value);
        },
        controller: myProvider.searchController,
        style: const TextStyle(color: Colors.black),
        enabled: true,
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: 'Search for any photo',
          hintStyle: const TextStyle(
            color: Colors.black45,
          ),
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          enabled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
        ),
      ),
    );
  }
}
