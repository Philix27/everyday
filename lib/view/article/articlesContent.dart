import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:everyday/controller/hive_controller.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/article.dart';
import 'package:everyday/view/widgets/widgets.dart';

class ArticlesContent extends StatelessWidget {
  const ArticlesContent({
    Key? key,
    required this.course,
  }) : super(key: key);
  final Article course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          course.title,
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (!HiveBoxes.bookmarkBox.containsKey(course.id))
                HiveBoxes.addBookmark(course);
              else
                HiveBoxes.bookmarkBox
                    .delete(int.tryParse(course.id))
                    .then((value) => MyWidgets.snackbar(title: 'Removed'));
            },
            icon: Icon(
              HiveBoxes.bookmarkBox.containsKey(int.tryParse(course.id))
                  ? Icons.bookmark
                  : Icons.bookmark_border_rounded,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: MarkdownBody(
            data: course.articleContent,
            selectable: true,
          ),
        ),
      ),
      // https://pub.dev/packages/flutter_markdown
    );
  }
}
