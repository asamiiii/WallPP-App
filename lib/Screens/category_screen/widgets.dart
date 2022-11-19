import 'package:flutter/material.dart';

PreferredSizeWidget categoryScreensAppBar(String catTitle) {
  return AppBar(
    elevation: 0,
    title: Text(catTitle,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black)),
  );
}