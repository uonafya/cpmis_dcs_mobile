import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/models/notification_model.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:cpims_dcs_mobile/views/widgets/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: FutureBuilder<List<NotificationModel>>(
          future: apiService.getNotifications(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      CustomCard(title: "Notifications", children: [
                        ...List.generate(
                          snapshot.data!.length,
                          (index) => NotificationListItem(
                            notification: snapshot.data![index],
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
                const Footer()
              ],
            );
          }),
    );
  }
}

class NotificationListItem extends StatelessWidget {
  const NotificationListItem({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 16,
              child: Text(
                notification.count.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.text ?? "-"),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 1),
                        child: Text(
                          notification.category ?? "-",
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white),
                        ),
                      ),
                      Text(
                        DateFormat("MMM dd, yyyy hh:mm a")
                            .format(DateTime.parse(notification.timestamp!)),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
