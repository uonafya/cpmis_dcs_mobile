import 'package:cpims_dcs_mobile/controller/crs_form_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_forms_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaseReportingWidget extends StatefulWidget {
  const CaseReportingWidget({super.key});

  @override
  State<CaseReportingWidget> createState() => _CaseReportingWidgetState();
}

class _CaseReportingWidgetState extends State<CaseReportingWidget> {
  RadioButtonOptions? isInCountry;

  String selectedCounty = pleaseSelect;
  String selectedSubCounty = pleaseSelect;

  DateTime dateOfCaseOpening = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<CRSFormProvider>(builder: (context, model, _) {
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
            initialValue: model.caseReport.originator,
            items: caseReporterOptions,
            onChanged: (dynamic item) {
              var update = model.caseReport;
              update.originator = item;
              model.caseReport = update;
            },
          ),
          const SizedBox(height: 20),
          if (model.caseReport.originator == "Court")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Court Name:*',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.courtName = value;
                      model.caseReport = update;
                    },
                    hintText: 'Court Name'),
                const SizedBox(height: 20),
                const Divider(),
                const Text(
                  'Court File Number:*',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.courtFileNumber = value;
                      model.caseReport = update;
                    },
                    hintText: 'Court Name'),
                const SizedBox(height: 20),
              ],
            )
          else if (model.caseReport.originator == "Police")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Police Station Name:*',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.policeStation = value;
                      model.caseReport = update;
                    },
                    hintText: 'Police Station Name'),
                const SizedBox(height: 20),
                const Divider(),
                const Text(
                  'OB Number:*',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.obNumber = value;
                      model.caseReport = update;
                    },
                    hintText: 'OB Number'),
                const SizedBox(height: 20),
              ],
            )
          else if (model.caseReport.originator == "Father" ||
              model.caseReport.originator == "Helpline 116" ||
              model.caseReport.originator == "Mother" ||
              model.caseReport.originator == "Probation" ||
              model.caseReport.originator == "Chief" ||
              model.caseReport.originator == "Immigration" ||
              model.caseReport.originator == "Labour Officers" ||
              model.caseReport.originator == "Helpline 1195" ||
              model.caseReport.originator == "Service Providers" ||
              model.caseReport.originator == "Ministry of Tourism" ||
              model.caseReport.originator == "Trade Union" ||
              model.caseReport.originator == "Other relatives" ||
              model.caseReport.originator == "Diplomatic missions" ||
              model.caseReport.originator == "Other Government Agencies" ||
              model.caseReport.originator == "Other non-relative(s)")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reporter Name(s):*',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.reporterFirstName = value;
                      model.caseReport = update;
                    },
                    hintText: 'First Name'),
                const SizedBox(height: 20),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.reporterLastName = value;
                      model.caseReport = update;
                    },
                    hintText: 'Surname'),
                const SizedBox(height: 20),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.reporterOtherName = value;
                      model.caseReport = update;
                    },
                    hintText: 'Middle Name'),
                const SizedBox(height: 20),
                const Divider(),
                const Text(
                  'Reporter Phone Number:*',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.reporterPhoneNumber = value;
                      model.caseReport = update;
                    },
                    hintText: 'Phone Number'),
                const SizedBox(height: 20),
              ],
            )
          else if (model.caseReport.originator == "Self")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Reporter Phone Number:*',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                    onChanged: (String value) {
                      var update = model.caseReport;

                      update.reporterPhoneNumber = value;
                      model.caseReport = update;
                    },
                    hintText: 'Phone Number'),
                const SizedBox(height: 20),
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
              var update = model.caseReport;
              update.placeOfOccurence = RadioButtonOptions.yes == value;
              model.caseReport = update;
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
              var update = model.caseReport;
              update.placeOfOccurence = RadioButtonOptions.yes == value;
              model.caseReport = update;
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
                      initialValue: model.caseReport.county,
                      items: countiesOptions,
                      onChanged: (dynamic item) {
                        var update = model.caseReport;
                        update.county = item;
                        model.caseReport = update;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Sub County *'),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      initialValue: model.caseReport.subCounty,
                      items: subcountiesOptions,
                      onChanged: (dynamic item) {
                        var update = model.caseReport;
                        update.subCounty = item;
                        model.caseReport = update;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 20),
                    const Text('Ward *'),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      initialValue: model.caseReport.ward ?? pleaseSelect,
                      items: subcountiesOptions,
                      onChanged: (dynamic item) {
                        var update = model.caseReport;
                        update.ward = item;
                        model.caseReport = update;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('Sub Location *'),
                    const SizedBox(height: 10),
                    CustomDropdown(
                      initialValue:
                          model.caseReport.subLocation ?? pleaseSelect,
                      items: subcountiesOptions,
                      onChanged: (dynamic item) {
                        var update = model.caseReport;
                        update.subLocation = item;
                        model.caseReport = update;
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
                      initialValue: model.caseReport.country,
                      items: countiesOptions,
                      onChanged: (dynamic item) {
                        var update = model.caseReport;
                        update.country = item;
                        model.caseReport = update;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text('City/Town *'),
                    const SizedBox(height: 10),
                    CustomTextField(
                      onChanged: (String item) {
                        var update = model.caseReport;
                        update.city = item;
                        model.caseReport = update;
                      },
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
            initialValue: model.caseReport.reportingSubCounty,
            items: countiesOptions,
            onChanged: (dynamic item) {
              var update = model.caseReport;
              update.reportingSubCounty = item;
              model.caseReport = update;
            },
          ),
          const SizedBox(height: 20),
          const Text('Organizational Unit *'),
          const SizedBox(height: 10),
          CustomDropdown(
            initialValue: model.caseReport.reportingOrganizationalUnit,
            items: countiesOptions,
            onChanged: (dynamic item) {
              var update = model.caseReport;
              update.reportingOrganizationalUnit = item;
              model.caseReport = update;
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
            lastDate: DateTime.now(),
            onDateSelected: (DateTime selectedDate) {
              var update = model.caseReport;
              update.dateCaseReported = selectedDate;
              model.caseReport = update;
            },
          )
        ],
      );
    });
  }
}
