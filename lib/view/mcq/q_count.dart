part of 'mcq_depart.dart';

Widget questions_count(String category) {
  return FutureBuilder(
      future: QuestionDb().getFor(category),
      builder: (BuildContext context, AsyncSnapshot<List<Question>> snapshot) {
        if (!snapshot.hasData)
          return Text(
            'Loading count...',
            style: Styles.bodyText2!.copyWith(fontSize: 10),
          );

        return Text(
          "${snapshot.data!.length.toString()} questions",
          style: Styles.bodyText2!.copyWith(fontSize: 10),
        );
      });
}
