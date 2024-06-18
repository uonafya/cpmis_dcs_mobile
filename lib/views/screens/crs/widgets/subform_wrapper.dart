import 'package:flutter/material.dart';

class SubformWrapper extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SubformWrapper({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )
            ],
          ),
        ),
    );
  }
}
