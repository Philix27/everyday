import 'package:flutter/material.dart';
import 'package:everyday/core/theme/styles.dart';

class NoContentPage extends StatelessWidget {
  const NoContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "everyday",
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Text(
          'No content yet',
          style: Styles.bodyText2,
        ),
      ),
    );
  }
}
