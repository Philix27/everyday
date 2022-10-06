import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/view/widgets/widgets.dart';

class MdDisplay extends StatefulWidget {
  const MdDisplay({
    Key? key,
    required this.title,
    required this.content,
    required this.onBookmarkTap,
  }) : super(key: key);
  final String title;
  final String content;
  final VoidCallback onBookmarkTap;

  @override
  State<MdDisplay> createState() => _MdDisplayState();
}

class _MdDisplayState extends State<MdDisplay> {
  double fontSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              MyWidgets.bottomSheet(
                Container(
                  color: Styles.scaffoldBackgroundColor,
                  height: 220,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Adjust Font Size",
                          style: Styles.headlineText2!.copyWith(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Slider.adaptive(
                          value: fontSize,
                          onChanged: (currentSize) {
                            setState(() {
                              fontSize = currentSize;
                            });
                          },
                          divisions: 4,
                          min: 1,
                          max: 2,
                          thumbColor: Styles.accentColor,
                          activeColor: Styles.primaryColorLight,
                        ),
                        const SizedBox(height: 10),
                        Divider(color: Styles.primaryColor),
                        ListTile(
                          tileColor: Styles.cardColor,
                          title: Text(
                            "Save/Bookmark",
                            style: Styles.headlineText2!.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: widget.onBookmarkTap,
                            icon: Icon(
                                // HiveBoxes.bookmarkBox
                                //         .containsKey(int.tryParse(widget.note.id))
                                //
                                Icons.bookmark
                                // : Icons.bookmark_border_rounded,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: MarkdownBody(
            data: widget.content,
            selectable: false,
            styleSheet: MarkdownStyleSheet(
              h1: Styles.headlineText1,
              h2: Styles.headlineText2,
              listBullet: Styles.bodyText2!.copyWith(fontSize: 14 * fontSize),
              p: Styles.bodyText2!.copyWith(fontSize: 14 * fontSize),
              h3: Styles.bodyText1!.copyWith(fontSize: 13),
              h4: Styles.bodyText1!.copyWith(fontSize: 11.5),
              // listBullet: TextStyle(),
            ),
          ),
        ),
      ),
      // https://pub.dev/packages/flutter_markdown
    );
  }
}
