import 'package:flutter/material.dart';

class StatisticsItem extends StatelessWidget {
  const StatisticsItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.secondaryColor,
      this.otherItems = const [],
      required this.onClick});
  final String title;
  final IconData icon;
  final Color color;
  final Color secondaryColor;
  final List<String> otherItems;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        width: double.infinity,
        color: color,
        margin: const EdgeInsets.symmetric(vertical: 7.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                            otherItems.length,
                            (index) => Text(
                                  "> ${otherItems[index]}",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 12),
                                )),
                      ]),
                ),
                Icon(
                  icon,
                  size: 60,
                  color: Colors.white12.withOpacity(0.3),
                )
              ]),
            ),
            Container(
              height: 35,
              width: double.infinity,
              color: secondaryColor,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Details',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                      size: 14,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.secondaryColor,
  });
  final String title;
  final IconData icon;
  final Color color;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
