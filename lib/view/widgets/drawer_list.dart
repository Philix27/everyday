import 'package:everyday/core/theme/styles.dart';
import 'package:flutter/material.dart';

Widget getDrawerListTile({
  required String title,
  required void Function() goTo,
}) {
  return ListTile(
    title: Text(
      title,
      style: Styles.headlineText2,
    ),
    onTap: goTo,
  );
}

Widget getDrawerHeaderListTile({
  required String title,
  required void Function() goTo,
}) {
  return ListTile(
    tileColor: Styles.primaryColor,
    title: Text(
      title,
      style: Styles.headlineText4!.copyWith(fontWeight: FontWeight.bold),
    ),
    onTap: goTo,
  );
}
