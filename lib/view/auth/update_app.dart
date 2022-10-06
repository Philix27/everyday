import 'package:everyday/core/theme/styles.dart';
import 'package:flutter/material.dart';
// import 'package:launch_review/launch_review.dart';

class UpdateApp extends StatelessWidget {
  const UpdateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Spacer(),
        Text(
          'Oops!',
          style: Styles.headlineText1,
        ),
        const SizedBox(height: 20),
        Text(
          'Sorry your app is out dated...',
          style: Styles.headlineText1,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/update.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        const Spacer(),
        Center(
          child: ElevatedButton(
            onPressed: () {
              // LaunchReview.launch();
            },

            // padding: const EdgeInsets.all(16),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Click to update",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    ));
  }
}
