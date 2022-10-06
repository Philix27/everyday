import 'package:flutter/material.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/article.dart';
// import 'package:everyday/view/article/courses_list.dart';
import 'package:everyday/view/article/articles_collections.dart';

class FindArticle extends SearchDelegate<Article> {
  @override
  String get searchFieldLabel => 'Search';

  @override
  TextStyle? get searchFieldStyle => Styles.bodyText2;

  @override
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
        hintStyle: Styles.bodyText2,
        contentPadding: const EdgeInsets.all(20),
        fillColor: Styles.canvasColor,
        focusColor: Styles.canvasColor,
        isCollapsed: true,
        filled: true,
        labelStyle: Styles.bodyText2,
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () => Navigator.pop(context),
        // onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    final List<Article> _coursesList = [];
    // final List<Article> _coursesList = query.isEmpty
    //     ? coursesList
    //     : coursesList.where((ho) {
    //         final string = ho.title.capitalize;

    //         return string!.contains(
    //             RegExp(query.capitalize!.trim(), caseSensitive: false));
    //       }).toList();

    return _coursesList.isEmpty
        ? Center(child: Text('No result found', style: Styles.bodyText2))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: _coursesList.length,
            itemBuilder: (context, index) {
              final c = _coursesList[index];
              return buildArticlesTile(context, c);
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Article> _coursesList = [];
    // final List<Article> _coursesList = query.isEmpty
    //     ? _coursesList
    //     : _coursesList.where((ho) {
    //         final string = ho.title.capitalize;

    //         return string!.contains(
    //             RegExp(query.capitalize!.trim(), caseSensitive: false));
    //       }).toList();

    return _coursesList.isEmpty
        ? Center(child: Text('No result found', style: Styles.bodyText2))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: _coursesList.length,
            itemBuilder: (context, index) {
              final c = _coursesList[index];
              return buildArticlesTile(context, c);
            },
          );
  }

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   return ThemeService().getThemeData().copyWith(
  //         inputDecorationTheme: InputDecorationTheme(
  //           contentPadding: const EdgeInsets.all(20),
  //           fillColor: Styles.canvasColor,
  //           focusColor: Styles.canvasColor,
  //           isCollapsed: true,
  //           filled: true,
  //           labelStyle: Styles.bodyText2,
  //         ),
  //       );
  // }
}
