import 'package:flutter/material.dart';
import 'package:everyday/core/theme/styles.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Text(
        "Logo",
        style: Styles.headlineText2,
      ),
    );
  }
}
