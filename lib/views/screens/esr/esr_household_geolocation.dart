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
  String selectedConstituency = 'Please select';
  String selectedSubCounty = 'Please select';
  String selectedSubLocation = 'Please select';
  String selectedVillage = 'Please select';
  final villageElderController = TextEditingController();
  final nearestChurchMosqueController = TextEditingController();
  final nearestSchoolController = TextEditingController();

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
              items: countyList,
              onChanged: (val) {
                setState(() {
                  selectedCounty = val;
                });
              }),
          if (selectedCounty != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (selectedCounty != 'Please select')
            const Text(
              'Constituency *',
            ),
          if (selectedCounty != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (selectedCounty != 'Please select')
            CustomDropdown(
                initialValue: selectedCounty,
                items: countyList,
                onChanged: (val) {
                  setState(() {
                    selectedConstituency = val;
                  });
                }),
          if (selectedConstituency != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (selectedConstituency != 'Please select')
            const Text(
              'Sub County *',
            ),
          if (selectedConstituency != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (selectedConstituency != 'Please select')
            CustomDropdown(
                initialValue: selectedCounty,
                items: countyList,
                onChanged: (val) {
                  setState(() {
                    selectedSubCounty = val;
                  });
                }),
          const SizedBox(
            height: 14,
          ),
          if (selectedSubCounty != 'Please select')
            const Text(
              'Sub Location *',
            ),
          if (selectedCounty != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (selectedSubCounty != 'Please select')
            CustomDropdown(
                initialValue: selectedCounty,
                items: countyList,
                onChanged: (val) {
                  setState(() {
                    selectedSubLocation = val;
                  });
                }),
          if (selectedSubCounty != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (selectedSubLocation != 'Please select')
            const Text(
              'Village *',
            ),
          if (selectedSubLocation != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (selectedSubLocation != 'Please select')
            CustomDropdown(
                initialValue: selectedCounty,
                items: countyList,
                onChanged: (val) {
                  setState(() {
                    selectedVillage = val;
                  });
                }),
          if (selectedVillage != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (selectedVillage != 'Please select')
            const Text(
              'Village Elder',
            ),
          if (selectedVillage != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (selectedVillage != 'Please select')
            CustomTextField(
              hintText: 'Village Elder',
              controller: villageElderController,
            ),
          if (selectedVillage != 'Please select')
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
