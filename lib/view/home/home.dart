import 'package:cached_network_image/cached_network_image.dart';
import 'package:everyday/view/widgets/drawer_list.dart';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:everyday/controller/blogs.dart';
import 'package:everyday/core/global_variables.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/blogs.dart';
import 'package:everyday/view/article/pep/mdDisplay.dart';
import 'package:everyday/view/profile/profile_page.dart';
import 'package:everyday/view/slider/slider_w.dart';
import 'package:everyday/view/widgets/loading.dart';

part 'homeList.dart';

class HomePage extends StatelessWidget {
  final ScrollController controller = ScrollController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Everyday",
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      drawer: Drawer(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Column(
            children: [
              const SizedBox(height: 40),
              getDrawerHeaderListTile(title: "Categories", goTo: () {}),
              getDrawerListTile(goTo: () {}, title: "All"),
              getDrawerListTile(goTo: () {}, title: "Pharmacy"),
              getDrawerListTile(goTo: () {}, title: "Electronics"),
              getDrawerListTile(goTo: () {}, title: "Home"),
              getDrawerListTile(goTo: () {}, title: "Others"),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...getHomeWidgetsList(context),
          ],
        ),
      ),
    );
    // body: getHomeWidgetsList(context)[0]);
  }
}
