import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_forms_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CaseReportingWidget extends StatefulWidget {
  const CaseReportingWidget({super.key});

  @override
  State<CaseReportingWidget> createState() => _CaseReportingWidgetState();
}

class _CaseReportingWidgetState extends State<CaseReportingWidget> {
  RadioButtonOptions? isInCountry;

  String selectedCounty = pleaseSelect;
  String selectedSubCounty = pleaseSelect;

  String caseReporter = pleaseSelect;

  DateTime dateOfCaseOpening = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Case Reporting',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Case Reporter/Originator:*',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        CustomDropdown(
          initialValue: caseReporter,
          items: caseReporterOptions,
          onChanged: (String item) {
            setState(() {
              caseReporter = item;
            });
          },
        ),
        const SizedBox(height: 20),
        if (caseReporter == "Court")
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Court Name:*',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(hintText: 'Court Name'),
              SizedBox(height: 20),
              Divider(),
              Text(
                'Court File Number:*',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(hintText: 'Court Name'),
              SizedBox(height: 20),
            ],
          )
        else if (caseReporter == "Police")
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Police Station Name:*',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(hintText: 'Police Station Name'),
              SizedBox(height: 20),
              Divider(),
              Text(
                'OB Number:*',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(hintText: 'OB Number'),
              SizedBox(height: 20),
            ],
          )
        else if (caseReporter == "Father" ||
            caseReporter == "Helpline 116" ||
            caseReporter == "Mother" ||
            caseReporter == "Probation" ||
            caseReporter == "Chief" ||
            caseReporter == "Immigration" ||
            caseReporter == "Labour Officers" ||
            caseReporter == "Helpline 1195" ||
            caseReporter == "Service Providers" ||
            caseReporter == "Ministry of Tourism" ||
            caseReporter == "Trade Union" ||
            caseReporter == "Other relatives" ||
            caseReporter == "Diplomatic missions" ||
            caseReporter == "Other Government Agencies" ||
            caseReporter == "Other non-relative(s)")
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reporter Name(s):*',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(hintText: 'First Name'),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Surname'),
              SizedBox(height: 20),
              CustomTextField(hintText: 'Middle Name'),
              SizedBox(height: 20),
              Divider(),
              Text(
                'Reporter Phone Number:*',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(hintText: 'Phone Number'),
              SizedBox(height: 20),
            ],
          )
        else if (caseReporter == "Self")
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Reporter Phone Number:*',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              CustomTextField(hintText: 'Phone Number'),
              SizedBox(height: 20),
            ],
          )
        else
          const SizedBox(),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Place of occurrence:*',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        const Text('In the country*'),
        const SizedBox(height: 10),
        RadioListTile<RadioButtonOptions>(
          title: const Text('Yes'),
          value: RadioButtonOptions.yes,
          groupValue: isInCountry,
          onChanged: (value) {
            setState(() {
              isInCountry = value;
            });
          },
        ),
        RadioListTile<RadioButtonOptions>(
          title: const Text('No'),
          value: RadioButtonOptions.no,
          groupValue: isInCountry,
          onChanged: (value) {
            setState(() {
              isInCountry = value;
            });
          },
        ),
        const SizedBox(height: 10),
        const Divider(),
        isInCountry == RadioButtonOptions.yes
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text('County *'),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    initialValue: selectedCounty,
                    items: countiesOptions,
                    onChanged: (String item) {
                      setState(() {
                        selectedCounty = item;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Sub County *'),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    initialValue: selectedSubCounty,
                    items: subcountiesOptions,
                    onChanged: (String item) {
                      setState(() {
                        selectedCounty = item;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 20),
                  const Text('Ward *'),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    initialValue: selectedSubCounty,
                    items: subcountiesOptions,
                    onChanged: (String item) {
                      setState(() {
                        selectedCounty = item;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('Sub Location *'),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    initialValue: selectedSubCounty,
                    items: subcountiesOptions,
                    onChanged: (String item) {
                      setState(() {
                        selectedCounty = item;
                      });
                    },
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Text('Country *'),
                  const SizedBox(height: 10),
                  CustomDropdown(
                    initialValue: selectedCounty,
                    items: countiesOptions,
                    onChanged: (String item) {
                      setState(() {
                        selectedCounty = item;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text('City/Town *'),
                  const SizedBox(height: 10),
                  const CustomTextField(
                    hintText: 'City/Town',
                  ),
                ],
              ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Place of reporting *',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        const Text('Sub County *'),
        const SizedBox(height: 10),
        CustomDropdown(
          initialValue: selectedCounty,
          items: countiesOptions,
          onChanged: (String item) {
            setState(() {
              selectedCounty = item;
            });
          },
        ),
        const SizedBox(height: 20),
        const Text('Organizational Unit *'),
        const SizedBox(height: 10),
        CustomDropdown(
          initialValue: selectedCounty,
          items: countiesOptions,
          onChanged: (String item) {
            setState(() {
              selectedCounty = item;
            });
          },
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 10),
        const Text(
          'Date Case Reported *',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        CustomFormsDatePicker(
          hintText: 'Date of Case Opening',
          onDateSelected: (DateTime selectedDate) {
            setState(() {
              dateOfCaseOpening = selectedDate;
            });
          },
        )
      ],
    );
  }
}
