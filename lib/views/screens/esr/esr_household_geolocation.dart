import 'package:cpims_dcs_mobile/controller/esr_controller.dart';
import 'package:cpims_dcs_mobile/core/network/locations.dart';
import 'package:cpims_dcs_mobile/models/nameid.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ESRHouseholdGeolocation extends StatefulWidget {
  const ESRHouseholdGeolocation({super.key});

  @override
  State<ESRHouseholdGeolocation> createState() =>
      _ESRHouseholdGeolocationState();
}

class _ESRHouseholdGeolocationState extends State<ESRHouseholdGeolocation> {
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
    final controller = Provider.of<ESRController>(context);
    return Form(
      key: controller.householdGeolocationFormKey,
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
              initialValue: controller.selectedCounty,
              items: counties.map((e) => e.name).toList(),
              validator: (val) {
                if (val == 'Please select') {
                  return 'Please select a county';
                }
                return null;
              },
              onChanged: (val) async {
                controller.setSelectedCounty(val);

                final values =
                    await getSubCountiesOfCounty(controller.selectedCounty);
                subCounty.addAll(values);
                setState(() {});
              }),
          if (controller.selectedCounty != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (controller.selectedCounty != 'Please select')
            const Text(
              'Sub County *',
            ),
          if (controller.selectedCounty != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (controller.selectedCounty != 'Please select')
            CustomDropdown(
                initialValue: controller.selectedSubCounty,
                validator: (val) {
                  if (val == 'Please select') {
                    return 'Please select a sub county';
                  }
                  return null;
                },
                items: subCounty.map((e) => e.name).toList(),
                onChanged: (val) async {
                  controller.setSelectedSubCounty(val);

                  final values = await getLocationsFromSubCounty(
                      controller.selectedSubCounty);

                  locationList.addAll(values);

                  setState(() {});
                }),
          const SizedBox(
            height: 14,
          ),
          if (controller.selectedSubCounty != 'Please select')
            const Text(
              'Location *',
            ),
          if (controller.selectedSubCounty != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (controller.selectedSubCounty != 'Please select')
            CustomDropdown(
                initialValue: controller.location,
                items: locationList.map((e) => e.name).toList(),
                validator: (val) {
                  if (val == 'Please select') {
                    return 'Please select a location';
                  }
                  return null;
                },
                onChanged: (val) async {
                  controller.setLocation(val);
                 
                  final values = await getSubLocationFromLocation(
                      controller.location);
                  subLocation.addAll(values);

                  setState(() {});
                }),
          if (controller.selectedSubCounty != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (controller.location != 'Please select')
            const Text(
              'Sub Location *',
            ),
          if (controller.location != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (controller.location != 'Please select')
            CustomDropdown(
                initialValue: controller.selectedSubLocation,
                // validator: (val) {
                //   if (val == 'Please select') {
                //     return 'Please select a sub location';
                //   }
                //   return null;
                // },
                items: subLocation.map((e) => e.name).toList(),
                onChanged: (val) async {
                  controller.setSelectedSubLocation(val);

                  setState(() {});
                }),
          if (controller.location != 'Please select')
            const SizedBox(
              height: 14,
            ),
          if (controller.selectedSubLocation != 'Please select')
            const Text(
              'Village Elder',
            ),
          if (controller.selectedSubLocation != 'Please select')
            const SizedBox(
              height: 10,
            ),
          if (controller.selectedSubLocation != 'Please select')
            CustomTextField(
              hintText: 'Village Elder',
              controller: controller.villageElderController,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please fill in the village elder';
                }
                return null;
              },
            ),
          if (controller.selectedSubLocation != 'Please select')
            const SizedBox(
              height: 14,
            ),
          const Text(
            'Duration of residence in this place *',
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'Years',
                  controller: controller.yearsController,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please select a sub county';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: CustomTextField(
                  hintText: 'Months',
                  controller: controller.monthsController,
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please select a sub county';
                    }
                    return null;
                  },
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
            controller: controller.nearestChurchMosqueController,
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
            controller: controller.nearestSchoolController,
          ),
        ],
      ),
    );
  }
}
