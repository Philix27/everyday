// import 'package:dio/dio.dart';
import 'package:everyday/api/notes.dart';
import 'package:everyday/models/article.dart';
import 'package:everyday/models/article_category.dart';

class ArticleDb {
  final NotesApi notesAPI = NotesApi();
  Future<List<Article>> getAllArticles() async {
    List<Article> _questions = [];
    try {
      var listOfMaps = await notesAPI.getAll();
      for (var i in listOfMaps) {
        _questions.add(Article.fromMap(i));
      }
    } catch (e) {
      // print(e);
    }

    return _questions;
  }

  Future<List<ArticlesCategory>> getAllCollections() async {
    List<ArticlesCategory> _categories = [];
    try {
      var listOfMaps = await notesAPI.getAllCategory();
      for (var i in listOfMaps) {
        _categories.add(ArticlesCategory.fromMap(i));
      }
    } catch (e) {
      // print(e);
    }

    return _categories;
  }

  Future<List<Article>> getSpecificNotesFromCollection(String category) async {
    List<Article> _questions = [];
    try {
      var listOfMaps = await notesAPI.getAll();
      for (var i in listOfMaps) {
        if (i['category'].toString().toLowerCase() == category.toLowerCase()) {
          _questions.add(Article.fromMap(i));
        }
      }
    } catch (e) {
      // print(e);
    }

    return _questions;
  }

  Future<List<ArticlesCategory>> getSpecificCollections(String category) async {
    List<ArticlesCategory> _categories = [];

    try {
      var listOfMaps = await notesAPI.getAllCategory();
      for (var i in listOfMaps) {
        // print(listOfMaps);
        if (i['department'].toString().toLowerCase() ==
            category.toLowerCase()) {
          _categories.add(ArticlesCategory.fromMap(i));
          // _questions.add(Article.fromMap(i));
          // print(i);
          // print("testing $i");
        }
      }
    } catch (e) {
      // print(e);
    }

    return _categories;
  }
}
