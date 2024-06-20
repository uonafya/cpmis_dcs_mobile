import 'package:cpims_dcs_mobile/core/network/locations.dart';
import 'package:cpims_dcs_mobile/models/nameid.dart';
import 'package:cpims_dcs_mobile/views/screens/esr/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';

class ESRHouseholdGeolocation extends StatefulWidget {
  const ESRHouseholdGeolocation({super.key});

  @override
  State<ESRHouseholdGeolocation> createState() =>
      _ESRHouseholdGeolocationState();
}

class _ESRHouseholdGeolocationState extends State<ESRHouseholdGeolocation> {
  String selectedCounty = 'Please select';

  String selectedSubCounty = 'Please select';
  String location = 'Please select';
  String selectedSubLocation = 'Please select';
  String selectedVillage = 'Please select';
  final villageElderController = TextEditingController();
  final nearestChurchMosqueController = TextEditingController();
  final nearestSchoolController = TextEditingController();
  List<NameID> counties = [
    const NameID(name: 'Please select', id: '1'),
  ];
  List<NameID> consistuency = [
    const NameID(name: 'Please select', id: '1'),
  ];
  List<NameID> subCounty = [
    const NameID(name: 'Please select', id: '1'),
  ];
  List<NameID> locationList = [
    const NameID(name: 'Please select', id: '1'),
  ];
  List<NameID> subLocation = [
    const NameID(name: 'Please select', id: '1'),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      counties = await getCounties();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'County *',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropdown(
              initialValue: selectedCounty,
              items: counties.map((e) => e.name).toList(),
              onChanged: (val) async {
                selectedCounty = val;
                selectedSubCounty = 'Please select';
                selectedSubLocation = 'Please select';
                location = 'Please select';

                final values = await getSubCountiesOfCounty(selectedCounty);
                subCounty.addAll(values);
                setState(() {});
              }),
          if (selectedCounty != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (selectedCounty != 'Please select')
            const Text(
              'Sub County *',
            ),
          if (selectedCounty != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (selectedCounty != 'Please select')
            CustomDropdown(
                initialValue: selectedSubCounty,
                items: subCounty.map((e) => e.name).toList(),
                onChanged: (val) async {
                  selectedSubCounty = val;

                  selectedSubLocation = 'Please select';
                  location = 'Please select';
                  final values =
                      await getLocationsFromSubCounty(selectedCounty);
                  print(values);
                  locationList.addAll(values);

                  setState(() {});
                }),
          const SizedBox(
            height: 14,
          ),
          if (selectedSubCounty != 'Please select')
            const Text(
              'Location *',
            ),
          if (selectedSubCounty != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (selectedSubCounty != 'Please select')
            CustomDropdown(
                initialValue: location,
                items: locationList.map((e) => e.name).toList(),
                onChanged: (val) async {
                  location = val;

                  selectedSubLocation = 'Please select';

                  final values = await getSubCountiesOfCounty(selectedCounty);
                  subLocation.addAll(values);

                  setState(() {});
                }),
          if (selectedSubCounty != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (location != 'Please select')
            const Text(
              'Sub Location *',
            ),
          if (location != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (location != 'Please select')
            CustomDropdown(
                initialValue: selectedSubLocation,
                items: subLocation.map((e) => e.name).toList(),
                onChanged: (val) async {
                  selectedSubLocation = val;

                  setState(() {});
                }),
          if (location != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (selectedSubLocation != 'Please select')
            const Text(
              'Village Elder',
            ),
          if (selectedSubLocation != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (selectedSubLocation != 'Please select')
            CustomTextField(
              hintText: 'Village Elder',
              controller: villageElderController,
            ),
          if (selectedSubLocation != 'Please select')
            const SizedBox(
              height: 14,
            ),
          const Text(
            'Duration of residence in this place',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'Years',
                  controller: nearestSchoolController,
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: CustomTextField(
                  hintText: 'Months',
                  controller: nearestSchoolController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Nearest Church/Mosque',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'Nearest Church/Mosque',
            controller: nearestChurchMosqueController,
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Nearest School',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            hintText: 'Nearest School',
            controller: nearestSchoolController,
          ),
        ],
      ),
    );
  }
}
