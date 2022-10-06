import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:everyday/models/question.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:everyday/view/widgets/widgets.dart';

class QuestionController extends GetxController {
  RxBool isCorrect = false.obs;
  RxBool isUnAnswered = true.obs;
  RxString optionsState = 'NONE'.obs;

  final Rx<List<Question>> _questionsList = Rx<List<Question>>([]);

  List<Question> get questions => _questionsList.value;

  void checkAnswer({required int tappedIndex, required int correctIndex}) {
    isUnAnswered.value = false;
    if (correctIndex == tappedIndex) {
      isCorrect.value = true;
      optionsState.value = "CORRECT";
      // return true;
    } else {
      isCorrect.value = false;
      optionsState.value = "WRONG";
    }

    // print("uio: Answer-${optionsState.value}");
  }

  Future<void> addMcq(Question q) => FirebaseFirestore.instance
      .collection('mcq')
      .doc(q.id)
      .set(q.toMap())
      .then((value) => MyWidgets.snackbar(title: "Sent"));
}
