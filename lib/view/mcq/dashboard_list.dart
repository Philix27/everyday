part of 'mcq.dart';

List<Widget> getHomeList(BuildContext context) => [
      dashboardCard(
        context,
        title: "PEP",
        page: PepNotesPageList(
          imgUrl: "assets/images/guyexam.jpg",
          sectionTitle: "PEP MCQs",
          futureList: PepDb.getAllPepMcq(),
        ),
        subtitle: 'Past Questions and Answers',
      ),
      dashboardCard(
        context,
        title: "PEP",
        page: PepNotesPageList(
          futureList: PepDb.getAllPepMcqDemo(),
          imgUrl: "assets/images/ladyexam.jpg",
          sectionTitle: "PEP MCQs",
        ),
        subtitle: 'Practice Questions & Answers',
      ),
      FutureBuilder(
        future: MyGlobals.notesDepartment.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Loading.spinKitFadingCircle();
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot postDoc = snapshot.data!.docs[index];

                final Department dd =
                    Department.fromMap(postDoc.data() as Map<String, dynamic>);
                return dashboardCard(
                  context,
                  title: dd.title,
                  page: MCQDepartments(
                    department: dd.title,
                    categoryList: [],
                  ),
                  subtitle: 'Departments',
                );
              });
        },
      ),
      // FutureBuilder(
      //   future: QuestionDb().getMCQCategories(),
      //   builder:
      //       (BuildContext context, AsyncSnapshot<List<MCQCategory>> snapshot) {
      //     if (!snapshot.hasData) return Loading.spinKitFadingCircle();
      //     List<String> snapy = [];
      //     snapshot.data!.forEach((el) {
      //       if (!snapy.contains(el.department)) {
      //         snapy.add(el.department);
      //       }
      //     });
      //     return ListView.builder(
      //         shrinkWrap: true,
      //         itemCount: snapy.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return dashboardCard(
      //             context,
      //             title: snapy[index],
      //             page: MCQDepartments(
      //               categoryList: snapshot.data!,
      //               department: snapy[index],
      //             ),
      //             subtitle: 'Department',
      //           );
      //         });
      //   },
      // ),
    ];
