import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:everyday/controller/drugs.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/brandDrugs.dart';
import 'package:everyday/view/drugs/drugs.dart';
import 'package:everyday/view/widgets/loading.dart';

class SearchBrands extends SearchDelegate<BrandDrugs> {
  @override
  String get searchFieldLabel => 'Search';

  @override
  TextStyle? get searchFieldStyle => Styles.bodyText2;

  @override
  InputDecorationTheme get searchFieldDecorationTheme => InputDecorationTheme(
        hintStyle: Styles.bodyText2,
        contentPadding: const EdgeInsets.all(20),
        fillColor: Styles.canvasColor,
        focusColor: Styles.canvasColor,
        isCollapsed: true,
        filled: true,
        labelStyle: Styles.bodyText2,
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          Get.back();
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        onPressed: () => Navigator.pop(context),
        // onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: DrugsDb.getAllBrands(),
      builder:
          (BuildContext context, AsyncSnapshot<List<BrandDrugs>> snapshot) {
        if (!snapshot.hasData) {
          return Loading.cubegrid();
        } else if (snapshot.data!.isEmpty) {
          return Container();
        } else {
          List<BrandDrugs> _drugList = [];

          _drugList = snapshot.data!.where((ho) {
            return ho.name.toUpperCase().contains(
                RegExp(query.toUpperCase().trim(), caseSensitive: false));
          }).toList();

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _drugList.length,
                itemBuilder: (BuildContext context, int index) {
                  BrandDrugs b = _drugList[index];
                  return buildDrugTile(context, b);
                }),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<BrandDrugs> _drugList = [];

    return FutureBuilder(
      future: DrugsDb.getAllBrands(),
      builder:
          (BuildContext context, AsyncSnapshot<List<BrandDrugs>> snapshot) {
        if (!snapshot.hasData) {
          return Loading.cubegrid();
        } else if (snapshot.data!.isEmpty) {
          return Container();
        } else {
          List<BrandDrugs> _drugList = [];

          _drugList = snapshot.data!.where((ho) {
            return ho.name.toUpperCase().contains(
                RegExp(query.toUpperCase().trim(), caseSensitive: false));
          }).toList();

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: _drugList.length,
                itemBuilder: (BuildContext context, int index) {
                  BrandDrugs b = _drugList[index];
                  return buildDrugTile(context, b);
                }),
          );
        }
      },
    );
  }

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   return ThemeService().getThemeData().copyWith(
  //         inputDecorationTheme: InputDecorationTheme(
  //           contentPadding: const EdgeInsets.all(20),
  //           fillColor: Styles.canvasColor,
  //           focusColor: Styles.canvasColor,
  //           isCollapsed: true,
  //           filled: true,
  //           labelStyle: Styles.bodyText2,
  //         ),
  //       );
  // }
}
