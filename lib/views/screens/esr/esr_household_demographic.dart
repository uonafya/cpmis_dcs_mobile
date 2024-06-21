import 'package:cpims_dcs_mobile/controller/esr_controller.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ESRHouseholdDemographic extends StatefulWidget {
  const ESRHouseholdDemographic({super.key});

  @override
  State<ESRHouseholdDemographic> createState() =>
      _ESRHouseholdDemographicState();
}

class _ESRHouseholdDemographicState extends State<ESRHouseholdDemographic> {
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final surnameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final esrCController = Provider.of<ESRController>(context);
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Starting from the head, what are the NAMES of the	members of the household?',
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'List members of the household by nuclear family; starting with the head and his wife and children, beginning with the eldest and working down to the youngest',
            style: TextStyle(backgroundColor: Colors.amberAccent),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'First Name *',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: "First Name",
            controller: firstNameController,
            validator: (val) {
              if (val!.isEmpty) {
                return "First Name is required";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Middle Name',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: "Middle Name",
            controller: middleNameController,
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Surname *',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: "Surname",
            controller: surnameController,
            validator: (val) {
              if (val!.isEmpty) {
                return "First Name is required";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 14,
          ),
          CustomButton(
            text: "Add Member",
            onTap: () {
              if (!formKey.currentState!.validate()) {
                return;
              }

              esrCController.addFamilyMember({
                "firstName": firstNameController.text,
                "middleName": middleNameController.text,
                "surname": surnameController.text,
              });
              setState(() {
                firstNameController.clear();
                middleNameController.clear();
                surnameController.clear();
              });
            },
          ),
          const SizedBox(
            height: 14,
          ),
          ...esrCController.familyMembers.map((member) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                                "${esrCController.familyMembers.indexOf(member) + 1}. ${member['firstName']} ${member['middleName']} ${member['surname']}"),
                            const SizedBox(
                              height: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            esrCController.removeFamilyMember(member);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 16,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            );
          }),
          const Divider(),
        ],
      ),
    );
  }
}
