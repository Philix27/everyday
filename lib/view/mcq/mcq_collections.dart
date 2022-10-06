import 'package:flutter/material.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/controller/question.dart';
import 'package:everyday/view/widgets/loading.dart';
import 'package:everyday/models/question.dart';
import 'quiz_card.dart';

class MCqCollections extends StatelessWidget {
  final String title;
  const MCqCollections({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: Styles.headlineText2)),
      // floatingActionButton: MyWidgets.fab(
      //   icon: Icons.add,
      //   onTap: () => MyWidgets.goTo(AddMcqPage(category: category)),
      // ),
      body: FutureBuilder(
        future: QuestionDb().getSpecificQuestionsFrom(title),
        builder:
            (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
          if (!snapshot.hasData) return Loading.spinKitFadingCircle();
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return QCard(
                question: snapshot.data![index],
                currentIndex: index,
                questionLength: snapshot.data!.length,
              );
            },
          );
        },
      ),
    );
  }
}
