import 'package:flutter/material.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/view/mcq/question_controller.dart';
import 'package:everyday/models/question.dart';
import 'package:everyday/view/widgets/widgets.dart';

class AddMcqPage extends StatefulWidget {
  const AddMcqPage({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;
  @override
  _AddMcqPageState createState() => _AddMcqPageState();
}

class _AddMcqPageState extends State<AddMcqPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  QuestionController questionController = QuestionController();

  TextEditingController readerIndex = TextEditingController();
  TextEditingController question = TextEditingController();
  TextEditingController answerIndex = TextEditingController();
  TextEditingController option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();

  clearAll() {
    answerIndex.clear();
    question.clear();
    option1.clear();
    option2.clear();
    option3.clear();
    option4.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Styles.backgroundColor,
        title: Text(
          "Add MCQ",
          style: Styles.headlineText1,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: readerIndex,
                  style: Styles.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please type the current number';
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: 'Question number'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: question,
                  maxLines: 20,
                  minLines: 4,
                  style: Styles.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please type an option';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Question',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: option1,
                  maxLines: 20,
                  minLines: 4,
                  style: Styles.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please type an option';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Option1',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: option2,
                  maxLines: 20,
                  minLines: 4,
                  style: Styles.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Option2',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: option3,
                  maxLines: 20,
                  minLines: 4,
                  style: Styles.bodyText2,
                  decoration: const InputDecoration(
                    hintText: 'Option3',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: option4,
                  maxLines: 20,
                  minLines: 4,
                  style: Styles.bodyText2,
                  decoration: const InputDecoration(
                    hintText: 'Option4',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: answerIndex,
                  maxLength: 7,
                  keyboardType: TextInputType.number,
                  style: Styles.bodyText2,
                  validator: (value) {
                    if (value!.isEmpty) {
                      MyWidgets.snackbar(
                        title: 'Kindly provide answer index',
                        bgColor: Styles.warningColor,
                      );
                      return 'Please write a title';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Answer index',
                  ),
                ),
                const SizedBox(height: 20),
                MyWidgets.raisedButton(
                  title: 'Upload',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      questionController.addMcq(
                        Question(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          answer: int.parse(answerIndex.text.trim()),
                          category: widget.category,
                          explain: "",
                          question: question.text.trim(),
                          options: [
                            option1.text.trim(),
                            option2.text.trim(),
                            if (option3.text.trim().isNotEmpty)
                              option3.text.trim(),
                            if (option4.text.trim().isNotEmpty)
                              option4.text.trim(),
                          ],
                        ),
                      );

                      clearAll();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
