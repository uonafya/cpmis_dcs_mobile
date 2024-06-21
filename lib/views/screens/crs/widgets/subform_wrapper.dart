import 'package:flutter/material.dart';

class SubformWrapper extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool shouldAlwaysAutoValidate;

  const SubformWrapper({super.key, required this.title, required this.children, this.shouldAlwaysAutoValidate = false});

  @override
  State<SubformWrapper> createState() => _SubformWrapperState();
}

class _SubformWrapperState extends State<SubformWrapper> {
  final _formKey = GlobalKey<FormState>();

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
                widget.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                autovalidateMode: widget.shouldAlwaysAutoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.children,
                ),
              )
            ],
          ),
        ),
    );
  }
}
