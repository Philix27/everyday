import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:everyday/core/theme/styles.dart';

Widget dashboardCard(
  BuildContext context, {
  required String title,
  required String subtitle,
  IconData? icon,
  required Widget page,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
      children: [
        ListTile(
          onTap: () {
            pushNewScreen(
              context,
              screen: page,
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
            // MyWidgets.goTo(page);
          },
          tileColor: Styles.canvasColor,
          title: Text(
            title,
            style: Styles.headlineText2!.copyWith(fontWeight: FontWeight.bold),
          ),
          trailing: Icon(icon),
          subtitle: Text(
            subtitle,
            style: Styles.bodyText2!.copyWith(fontSize: 10),
          ),
        ),
        Divider(
          color: Styles.backgroundColor,
          height: 2,
        ),
      ],
    ),
  );
}
