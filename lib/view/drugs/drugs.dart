import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:everyday/controller/drugs.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/brandDrugs.dart';
import 'package:everyday/view/drugs/drugInfo.dart';
import 'package:everyday/view/drugs/search.dart';
import 'package:everyday/view/widgets/loading.dart';

class DrugsPage extends StatelessWidget {
  const DrugsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Find a drugs",
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchBrands(),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: FutureBuilder(
        future: DrugsDb.getAllBrands(),
        builder:
            (BuildContext context, AsyncSnapshot<List<BrandDrugs>> snapshot) {
          if (!snapshot.hasData) {
            return Loading.spinKitThreeBounce();
          } else if (snapshot.data!.isEmpty) {
            return Container();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    BrandDrugs b = snapshot.data![index];
                    return buildDrugTile(context, b);
                  }),
            );
          }
        },
      ),
    );
  }
}

Widget buildDrugTile(BuildContext context, BrandDrugs b) => Column(
      children: [
        ListTile(
          onTap: () {
            pushNewScreen(
              context,
              screen: DrugInfo(brandDrug: b),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          },
          tileColor: Styles.canvasColor,
          title: Text(
            b.name,
            style: Styles.headlineText2,
          ),
          subtitle: Text(
            b.generic,
            style: Styles.bodyText2!.copyWith(fontSize: 10),
          ),
          trailing: Text(
            b.dosageForm,
            style: Styles.bodyText2!.copyWith(fontSize: 10),
          ),
        ),
        Divider(
          color: Styles.backgroundColor,
          height: 2,
        ),
      ],
    );
