import 'package:flutter/material.dart';
import '../views/fixed_data.dart';
import '../views/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              categoryHomeText('Popular now'), 
              const SizedBox(height: 10),   // Top separator
              customSliderList(list: popUrl, imgWidth: 160, imgHight: 250, listHight: 250,isCategory: false),
              const SizedBox(height: 20),   // Bottom separator

              categoryHomeText('Categories'),
              const SizedBox(height: 10),   // Top separator
              customSliderList(list: catUrl, imgWidth: 220, imgHight: 150, listHight: 150,isCategory: true,catListText: catListText),
              const SizedBox(height: 20),   // Bottom separator
              
              categoryHomeText('Nowest'),
              const SizedBox(height: 10),   // Top separator
              customSliderList(list: popUrl, imgWidth: 160, imgHight: 250, listHight: 300,isCategory: false),
            ],
          ),
        ),
      ),
    );
  }
}
