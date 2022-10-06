import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:everyday/controller/hive_controller.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/view/article/pep/mdDisplay.dart';
import 'package:everyday/view/widgets/loading.dart';

import '../../../models/pepNote.dart';

class PepNotesPageList extends StatelessWidget {
  const PepNotesPageList({
    Key? key,
    required this.imgUrl,
    required this.sectionTitle,
    required this.futureList,
  }) : super(key: key);
  // final String script;

  final String imgUrl;
  final String sectionTitle;
  final Future<List<PepNote>> futureList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                sectionTitle,
                style: Styles.headlineText2!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: Styles.canvasColor,
              expandedHeight: MediaQuery.of(context).size.height * 0.2,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      child: Image(
                        image: AssetImage(imgUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: FutureBuilder(
            future: futureList,
            // stream: MyGlobals.homeBannerCollection.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<List<PepNote>> snapshot) {
              if (!snapshot.hasData) {
                return Loading.spinKitThreeBounce();
              } else if (snapshot.data!.isEmpty) {
                return Container();
              } else {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildPepNotesTile(context, snapshot.data![index]);
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget buildPepNotesTile(BuildContext context, PepNote note) => Column(
      children: [
        ListTile(
          onTap: () {
            pushNewScreen(
              context,
              screen: MdDisplay(
                title: note.title,
                content: note.content,
                onBookmarkTap: () {
                  if (!HiveBoxes.pepNotesBox.containsKey(note.id))
                    HiveBoxes.savePepNote(note);
                },
              ),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
            // Get.to(
            //   () => ArticlesContent(course: course),
            // );
          },
          tileColor: Styles.canvasColor,
          title: Text(
            note.title,
            style: Styles.headlineText2,
          ),
        ),
        Divider(
          color: Styles.backgroundColor,
          height: 2,
        ),
      ],
    );
