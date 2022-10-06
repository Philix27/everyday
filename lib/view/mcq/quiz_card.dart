import 'package:everyday/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/question.dart';

class QCard extends StatefulWidget {
  final Question question;
  final int currentIndex;
  final int questionLength;

  const QCard({
    Key? key,
    required this.question,
    required this.currentIndex,
    required this.questionLength,
  }) : super(key: key);

  @override
  State<QCard> createState() => QCardState();
}

class QCardState extends State<QCard> {
  String optionsState = "NONE";
  int? selectedIndex;
  bool isAnswered = false;
  bool showExplain = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 30.0)),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Styles.cardColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "${widget.currentIndex + 1}.  ${widget.question.question}",
                  style: Styles.subtitle1,
                  softWrap: true,
                ),
                const SizedBox(height: 20 / 2),
                ...List.generate(
                  widget.question.options.length,
                  (index) {
                    bool isCorrectOption = false;
                    return InkWell(
                      onTap: () {
                        if (!isAnswered) {
                          isAnswered = true;
                          setState(() {
                            selectedIndex = index;
                          });
                          if (selectedIndex == widget.question.answer) {
                            setState(() {
                              isCorrectOption = true;
                            });
                          }
                        }
                      },
                      child: _Option(
                        correctIndex: widget.question.answer,
                        index: index,
                        text: widget.question.options[index],
                        optionsState: optionsState,
                        selectedIndex: selectedIndex,
                        isCorrectOption:
                            selectedIndex == widget.question.answer,
                        isAnswered: isAnswered,
                      ),
                    );
                  },
                ),
                if (isAnswered) const SizedBox(height: 25),
                if (isAnswered)
                  MyWidgets.raisedButton(
                    title: "Show More",
                    color: Styles.primaryColor,
                    onPressed: () {
                      setState(() {
                        showExplain = !showExplain;
                      });
                    },
                  ),
                const SizedBox(height: 25),
                if (showExplain)
                  Text(
                    "Ans: ${widget.question.answer + 1}\n${widget.question.explain}",
                    style: Styles.headlineText2,
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    Key? key,
    required this.text,
    this.index,
    this.correctIndex,
    this.selectedIndex,
    this.isCorrectOption,
    required this.isAnswered,
    // this.press,
    this.optionsState,
    // this.controller,
  }) : super(key: key);

  final int? correctIndex;
  final int? selectedIndex;
  final String text;
  final String? optionsState;
  final int? index;
  final bool? isCorrectOption;
  final bool isAnswered;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(20),
      decoration: afterCardClick(
        selectedIndex == index ? true : false,
        isCorrectOption!,
        isAnswered,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "${index! + 1}. $text",
          style: Styles.bodyText2,
          softWrap: true,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Decoration afterCardClick(
    bool isSelected,
    bool isCorrectOption,
    bool isAnswered,
  ) {
    if (isSelected) {
      return BoxDecoration(
        color: isCorrectOption ? kGreenColor : Styles.warningColor,
        border: Border.all(
          color: isCorrectOption ? kGreenColor : Styles.warningColor,
        ),
        borderRadius: BorderRadius.circular(10),
      );
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      );
    }
  }
}

const kGreenColor = Color(0xFF6AC259);
