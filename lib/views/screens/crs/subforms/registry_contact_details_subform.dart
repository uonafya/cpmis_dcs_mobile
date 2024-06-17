import 'package:flutter/material.dart';

import '../../../widgets/custom_text_field.dart';
import '../widgets/subform_wrapper.dart';

class RegistryContactDetailsSubform extends StatefulWidget {
  const RegistryContactDetailsSubform({super.key});

  @override
  State<RegistryContactDetailsSubform> createState() => _RegistryContactDetailsSubformState();
}

class _RegistryContactDetailsSubformState extends State<RegistryContactDetailsSubform> {
  @override
  Widget build(BuildContext context) {
    return const SubformWrapper(
      title: "Contact Information",
      children: [
        SizedBox(height: 10),
        Text('Designated Mobile Number *',),
        CustomTextField(hintText: '07xxxxxxxx'),
        SizedBox(height: 15),
        Text(
          'Other Mobile Number',
          style: TextStyle(color: Colors.black),),
        CustomTextField(hintText: '07xxxxxxxx'),
        SizedBox(height: 15),
        Text(
          'Email Address',
          style: TextStyle(color: Colors.black),),
        CustomTextField(hintText: 'Email Address'),
        SizedBox(height: 15),
        Text(
            'Physical Location',
            style: TextStyle(color: Colors.black)),
        CustomTextField(hintText: '', maxLines: 4),
        SizedBox(height: 15,),
      ],
    );
  }
}
