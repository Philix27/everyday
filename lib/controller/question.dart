import 'package:get/get.dart';
import 'package:everyday/api/question.dart';
import 'package:everyday/models/mcq_category.dart';
import 'package:everyday/models/question.dart';

class QuestionDb extends GetxController {
  final QuestionApi qAPI = QuestionApi();
  @override
  void onInit() {
    super.onInit();
    // qAPI = QuestionApi();
  }

  Future<List<Question>> getAllQuestions() async {
    List<Question> _questions = [];
    try {
      var listOfMaps = await qAPI.getAll();
      for (var i in listOfMaps) {
        _questions.add(Question.fromMap(i));
      }
    } catch (e) {
      // print(e);
    }

    return _questions;
  }

  Future<List<MCQCategory>> getCategories() async {
    List<MCQCategory> _categories = [];
    try {
      var listOfMaps = await qAPI.getAll();
      for (var i in listOfMaps) {
        if (!_categories.contains(i['category'])) {
          _categories.add(MCQCategory.fromMap(i));
        }
      }
      // print(_categories);
    } catch (e) {
      // print(e);
    }

    return _categories;
  }

  Future<List<MCQCategory>> getMCQSpecificCategories(String category) async {
    List<MCQCategory> _categories = [];
    try {
      var listOfMaps = await qAPI.getAllCategory();
      print(listOfMaps);
      for (var i in listOfMaps) {
        if (i['department'] == category) {
          _categories.add(MCQCategory.fromMap(i));
        }
      }
      // print(_categories);
    } catch (e) {
      // print(e);
    }

    return _categories;
  }

  Future<List<Question>> getFor(String category) async {
    List<Question> _questions = [];
    try {
      var listOfMaps = await qAPI.getAll();
      for (var i in listOfMaps) {
        if (i['category'] == category) {
          _questions.add(Question.fromMap(i));
        }
      }
    } catch (e) {
      // print(e);
    }

    return _questions;
  }

  Future<List<Question>> getSpecificQuestionsFrom(String category) async {
    List<Question> _questions = [];
    try {
      var listOfMaps = await qAPI.getAll();
      print("some- ${listOfMaps}");
      for (var i in listOfMaps) {
        if (i['category'] == category) {
          _questions.add(Question.fromMap(i));
        }
      }
    } catch (e) {
      // print(e);
    }

    return _questions;
  }
}
