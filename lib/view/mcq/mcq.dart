import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:everyday/controller/pepNotes.dart';
import 'package:everyday/core/global_variables.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/view/article/index.dart';
import 'package:everyday/view/article/pep/pepNotesList.dart';
import 'package:everyday/view/bookmark/bookmark_page.dart';
import 'package:everyday/view/mcq/mcq_depart.dart';
import 'package:everyday/view/widgets/dashboard_card.dart';
import 'package:everyday/view/widgets/loading.dart';
import 'package:everyday/view/widgets/widgets.dart';

part 'dashboard_list.dart';

class MCQPage extends StatefulWidget {
  const MCQPage({Key? key}) : super(key: key);

  @override
  State<MCQPage> createState() => _MCQPageState();
}

class _MCQPageState extends State<MCQPage> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "MCQs",
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButton: MyWidgets.fab(
        icon: Icons.bookmark,
        onTap: () => Get.to(BookmarkPage(
          bookmark: Bookmark.mcq,
          title: 'Saved MCQs ',
        )),
      ),
      body: ListView(
        controller: controller,
        shrinkWrap: true,
        children: [
          ...getHomeList(context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.refresh,
                ),
                onPressed: () {
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
