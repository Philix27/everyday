part of 'article_department.dart';

Widget articles_count(String category) {
  return FutureBuilder(
      future: ArticleDb().getSpecificCollections(category),
      builder: (BuildContext context,
          AsyncSnapshot<List<ArticlesCategory>> snapshot) {
        if (!snapshot.hasData)
          return Text(
            'Loading count...',
            style: Styles.bodyText2!.copyWith(fontSize: 10),
          );

        return Text(
          "${snapshot.data!.length.toString()} articles",
          style: Styles.bodyText2!.copyWith(fontSize: 10),
        );
      });
}
