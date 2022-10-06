part of 'bookmark_page.dart';

Widget getBookList(bool isNote) {
  if (isNote) {
    return ValueListenableBuilder<Box<PepNote>>(
      valueListenable: HiveBoxes.pepNotesBox.listenable(),
      builder: (context, box, _) {
        final List<PepNote> _pepNote = box.values.toList().cast<PepNote>();
        final List<int> coursesKeys = box.keys.toList().cast<int>();
        if (_pepNote.isEmpty) {
          return Center(
            child: Text(
              'No saved note',
              style: Styles.bodyText2,
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _pepNote.length,
            itemBuilder: (context, index) {
              return _buildPepNotesTile(
                _pepNote[index],
                coursesKeys[index],
              );
            },
          ),
        );
      },
    );
  } else {
    return ValueListenableBuilder<Box<Article>>(
      valueListenable: HiveBoxes.bookmarkBox.listenable(),
      builder: (context, box, _) {
        final List<Article> courses = box.values.toList().cast<Article>();
        final List<int> coursesKeys = box.keys.toList().cast<int>();
        if (courses.isEmpty) {
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return _buildArticlesTile(
                courses[index],
                coursesKeys[index],
              );
            },
          ),
        );
      },
    );
  }
}
