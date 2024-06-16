import 'package:flutter/material.dart';

class InitialLoaderScreen extends StatelessWidget {
  const InitialLoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Spacer(),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/logo_gok.png'),
            ),
            const Spacer(),
            const Text(
              'Loading...',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
