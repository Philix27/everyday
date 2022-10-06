import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:everyday/controller/auth_controller.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/view/widgets/loading.dart';
import 'package:everyday/view/widgets/widgets.dart';

class SignUpFormPage extends GetWidget<AuthController> {
  SignUpFormPage({Key? key}) : super(key: key);

  bool isUploading = false;
  TextEditingController postController = TextEditingController();
  TextEditingController postTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: Styles.headlineText2!.copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: postTitleController,
                  maxLines: 2,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Title...',
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: postController,
                  maxLines: 20,
                  minLines: 10,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Make your suggestion/complain...',
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: isUploading
                      ? Loading.spinKitThreeBounce()
                      : MyWidgets.raisedButton(
                          title: 'Send',
                          onPressed: () {
                            // => uploadPost(),
                            controller.postDetails();
                          },
                        ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

uploadPost() {}
