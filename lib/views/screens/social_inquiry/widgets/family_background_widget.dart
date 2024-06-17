import 'package:flutter/material.dart';

class FamilyBackgroundWidget extends StatelessWidget {
  const FamilyBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Section 2: Family Background',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 10),
        Divider(),
        Text(
          'Case Record Sheet',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text('CCO/32/213/5/29/5/2016 - July 1, 2016'),
        SizedBox(height: 10),
        Text(
          '1. View case (CCO/32/213/5/29/5/2016 - July 1, 2016)',
          style:
              TextStyle(fontSize: 11, color: Color.fromARGB(255, 27, 107, 173)),
        ),
        SizedBox(height: 20),
        Divider(),
        Text(
          'Parents / Caregiver Particulars',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Divider(),
        Text(
          "Parent (Father)'s Names",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          'CHEGE MUMBA',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 5),
        Divider(),
        Text(
          "Parent (Mother)'s Names",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
        Text(
          'ROSE WANGECHI',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(height: 5),
        Divider(),
        SizedBox(height: 20),
        Text(
          'Home Particulars',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ward',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Molo',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 5),
        SizedBox(height: 5),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sub-county',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Molo',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
