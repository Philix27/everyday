import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/view/widgets/loading.dart';
import 'package:flutter/material.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icon/cc.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(child: Loading.spinKitFadingCircle(color: Colors.white)),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                'Initializing everyday...',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
