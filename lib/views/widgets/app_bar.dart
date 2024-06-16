import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar customAppBar() {
  return AppBar(
    leading: GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/logo_gok.png'),
      ),
    ),
    title: const Text('CPIMS - Kenya'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          FontAwesomeIcons.bell,
          size: 20,
        ),
      ),
      Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        );
      }),
    ],
  );
}
