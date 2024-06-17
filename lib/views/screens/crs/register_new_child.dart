import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterNewChildScreen extends StatefulWidget {
  const RegisterNewChildScreen({super.key});

  @override
  State<RegisterNewChildScreen> createState() => _RegisterNewChildScreenState();
}

class _RegisterNewChildScreenState extends State<RegisterNewChildScreen> {
  List<String> personCriteria = [
    'Please Select',
    'Child',
    'Caregiver',
    'Goverment Employee',
    'NGO/private sector employee',
  ];
  String selectedPersonCriteria = 'Please Select';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        drawer: const Drawer(),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            const SizedBox(height: 20),
            const Text('Persons Registry Sheet',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 5),
            const Text(
              'Register new child',
              style: TextStyle(color: kTextGrey),
            ),
            const SizedBox(height: 30),
            CustomCard(title: 'Create Person', children: [
              const Text(
                'Personal details',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 10),
              const Text(
                'Person Type *',
                style: TextStyle(color: kTextGrey),
              ),
              CustomDropdown(
                initialValue: selectedPersonCriteria,
                items: personCriteria,
                onChanged: (val) {
                  setState(() {
                    selectedPersonCriteria = val;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Person is also a caregiver',
                style: TextStyle(color: kTextGrey),
              ),
              Checkbox(value: false, onChanged: (val) {}),
              const SizedBox(height: 10),
              const Text(
                'Provides services directly to children *',
                style: TextStyle(color: kTextGrey),
              ),
              // checkbox with two values, true or false
              Checkbox(value: false, onChanged: (val) {}),
              const SizedBox(height: 10),
              const Text(
                'First Name *',
                style: TextStyle(color: kTextGrey),
              ),
              const CustomTextField(hintText: 'First Name'),
              const SizedBox(height: 15),
              const Text(
                'Surname *',
                style: TextStyle(color: kTextGrey),
              ),
              const CustomTextField(hintText: 'Surname'),
              const SizedBox(height: 15),
              const Text('Other Names', style: TextStyle(color: kTextGrey)),
              const CustomTextField(hintText: 'Other Names'),
              const SizedBox(height: 15),
              const Text(
                'Sex *',
                style: TextStyle(color: kTextGrey),
              ),
              CustomDropdown(
                initialValue: "Please Select",
                items: const ["Please Select", "Male", "Female"],
                onChanged: (val) {
                  setState(() {
                    selectedPersonCriteria = val;
                  });
                },
              ),
              const SizedBox(height: 15),
              const Text(
                'Date of Birth *',
                style: TextStyle(color: kTextGrey),
              ),
              const CustomTextField(hintText: 'Date of Birth'),
            ]),
          ],
        ));
  }
}
