import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:everyday/controller/hive_controller.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/article.dart';
import 'package:everyday/models/pepNote.dart';
import 'package:everyday/view/article/articlesContent.dart';
import 'package:everyday/view/article/pep/mdDisplay.dart';
part 'booklist.dart';

enum Bookmark { mcq, notes }

class BookmarkPage extends StatelessWidget {
  BookmarkPage({
    Key? key,
    required this.bookmark,
    required this.title,
  }) : super(key: key);
  final ScrollController controller = ScrollController();
  final Bookmark bookmark;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          bottomOpacity: 0,
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: Styles.headlineText2!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (bookmark == Bookmark.mcq) {
                  HiveBoxes.bookmarkBox.clear();
                }
                if (bookmark == Bookmark.notes) {
                  HiveBoxes.pepNotesBox.clear();
                }
              },
              icon: const Icon(Icons.delete_sweep_rounded),
            ),
          ]),
      body: SingleChildScrollView(
        child: getBookList(bookmark == Bookmark.notes ? true : false),
      ),
    );
  }
}

Widget _buildArticlesTile(Article course, int key) => Dismissible(
      key: Key(UniqueKey().toString()),
      onDismissed: (direction) => HiveBoxes.bookmarkBox.delete(key),
      background: Container(
        alignment: Alignment.centerRight,
        color: Styles.warningColor,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () => Get.to(
              () => ArticlesContent(course: course),
            ),
            tileColor: Styles.canvasColor,
            title: Text(
              course.title,
              style: Styles.headlineText2,
            ),
          ),
          Divider(
            color: Styles.backgroundColor,
            height: 2,
          ),
        ],
      ),
    );

Widget _buildPepNotesTile(PepNote note, int key) => Dismissible(
      key: Key(UniqueKey().toString()),
      onDismissed: (direction) => HiveBoxes.bookmarkBox.delete(key),
      background: Container(
        alignment: Alignment.centerRight,
        color: Styles.warningColor,
        padding: const EdgeInsets.only(right: 20.0),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Column(
        children: [
          ListTile(
            onTap: () => Get.to(
              () => MdDisplay(
                title: note.title,
                content: note.content,
                onBookmarkTap: () {
                  if (!HiveBoxes.pepNotesBox.containsKey(note.id))
                    HiveBoxes.savePepNote(note);
                },
              ),
            ),
            tileColor: Styles.canvasColor,
            title: Text(
              note.title,
              style: Styles.headlineText2,
            ),
            subtitle: Text(
              "Notes",
              style: Styles.headlineText2!.copyWith(fontSize: 11),
            ),
          ),
          Divider(
            color: Styles.backgroundColor,
            height: 2,
          ),
        ],
      ),
    );
