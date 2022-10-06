part of 'slider_w.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({Key? key, required this.ref}) : super(key: key);
  final CollectionReference ref;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Styles.headlineText2,
        ),
        centerTitle: true,
      ),
      floatingActionButton: MyWidgets.fab(
          icon: Icons.add,
          onTap: () {
            Get.to(() =>  AddSlider(ref: ref));
          }),
      body: StreamBuilder(
        stream: ref.orderBy("timePosted").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Loading.spinKitThreeBounce();
          } else if (snapshot.data!.docs.isEmpty) {
            return Container(
              child: Text(
                "Empty",
                style: Styles.bodyText2,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot postDoc = snapshot.data!.docs[index];

                final SliderModel slide =
                    SliderModel.fromMap(postDoc.data() as Map<String, dynamic>);
                return Dismissible(
                  key: Key(UniqueKey().toString()),
                  onDismissed: (direction) {
                    // if (Get.find<UserController>()
                    //     .user
                    //     .adminTypes
                    //     .contains("Manager")) {
                    //   SliderModel.deleteItem(slide.docID);
                    // }
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Styles.warningColor,
                    padding: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Text(
                          slide.title,
                          maxLines: 1,
                          style: Styles.headlineText2,
                        ),
                        subtitle: Text(
                          slide.details,
                          maxLines: 2,
                          style: Styles.headlineText2!.copyWith(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
