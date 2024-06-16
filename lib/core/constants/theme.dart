import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[50],
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.4,
    ),
    useMaterial3: false,
    fontFamily: 'IBM Plex Sans',
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: kPrimaryColor, selectionColor: kPrimaryColor),
    textTheme: Typography.englishLike2021.apply(
        fontSizeFactor: 1,
        bodyColor: Colors.black,
        fontFamily: 'IBM Plex Sans'),
  );
}
