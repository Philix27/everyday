import 'package:flutter/material.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/controller/question.dart';
import 'package:everyday/models/mcq_category.dart';
import 'package:everyday/models/question.dart';
import 'package:everyday/view/mcq/mcq_collections.dart';
import 'package:everyday/view/widgets/dashboard_card.dart';
import 'package:everyday/view/widgets/loading.dart';

part 'q_count.dart';

class MCQDepartments extends StatelessWidget {
  const MCQDepartments({
    Key? key,
    required this.department,
    required this.categoryList,
  }) : super(key: key);
  final String department;
  final List<MCQCategory> categoryList;
  @override
  Widget build(BuildContext context) {
    List<MCQCategory> _cList = [];
    categoryList.forEach((ele) {
      if (ele.department == department) _cList.add(ele);
    });
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        backgroundColor: Styles.backgroundColor,
        title: Text(
          department,
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: QuestionDb().getMCQSpecificCategories(department),
        builder:
            (BuildContext context, AsyncSnapshot<List<MCQCategory>> snapshot) {
          if (!snapshot.hasData) return Loading.spinKitFadingCircle();
          // List<String> snapy = [];
          // snapshot.data!.forEach((el) {
          //   if (!snapy.contains(el.department)) {
          //     snapy.add(el.department);
          //   }
          // });
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                MCQCategory qq = snapshot.data![index];
                return dashboardCard(
                  context,
                  title: qq.title.toUpperCase(),
                  page: MCqCollections(
                    title: qq.title,
                  ),
                  subtitle: 'Collection',
                );
              });
        },
      ),

      //  ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: _cList.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     MCQCategory category = _cList[index];
      //     return Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //       child: Column(
      //         children: [
      //           ListTile(
      //             tileColor: Styles.canvasColor,
      //             onTap: () => pushNewScreen(
      //               context,
      //               screen: MCqCollections(title: category.title),
      //               withNavBar: true, // OPTIONAL VALUE. True by default.
      //               pageTransitionAnimation: PageTransitionAnimation.cupertino,
      //             ),
      //             title: Text(
      //               category.title.toLowerCase(),
      //               style: Styles.headlineText2!
      //                   .copyWith(fontWeight: FontWeight.bold),
      //             ),
      //             subtitle: questions_count(category.title),
      //           ),
      //           Divider(color: Styles.backgroundColor, height: 2),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
