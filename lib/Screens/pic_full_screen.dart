import 'package:flutter/material.dart';

import '../views/widgets.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        //padding: EdgeInsets.all(8),
        height: double.infinity,
        width: double.infinity,
        child: setWallSliderList(
          url: url,
          imgHight: double.infinity,
          imgWidth: double.infinity,
        ),
      ),
    );
  }
}
