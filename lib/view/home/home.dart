import 'package:cached_network_image/cached_network_image.dart';
import 'package:everyday/controller/products.dart';
import 'package:everyday/models/product.dart';
import 'package:everyday/view/home/search.dart';
import 'package:everyday/view/home/product_details.dart';
import 'package:everyday/view/widgets/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:everyday/controller/blogs.dart';
import 'package:everyday/core/global_variables.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/blogs.dart';
import 'package:everyday/view/slider/slider_w.dart';
import 'package:everyday/view/widgets/loading.dart';

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
          style: Styles.headlineText1!.copyWith(
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
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Drawer(
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
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       ...getHomeWidgetsList(context),
      //     ],
      //   ),
      // ),
      body: FutureBuilder(
        future: ProductsDb.getAllBrands(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            return Loading.cubegrid();
          } else if (snapshot.data!.isEmpty) {
            return Container();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              // child: ListView.builder(
              //     shrinkWrap: true,
              //     itemCount: snapshot.data!.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       Product b = snapshot.data![index];
              //       return buildDrugTile(context, b);
              //     }),
              // child: StaggeredGridTile.fit(
              //   crossAxisCellCount: 2,
              //   child: SizedBox(
              //     child: Text(),
              //   ),
              // ),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 3.5 / 5,
                    // mainAxisExtent: 2,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product b = snapshot.data![index];
                    return buildProductCard(b);
                  }),
            );
          }
        },
      ),
    );
    // body: getHomeWidgetsList(context)[0]);
  }
}

Widget buildProductCard(Product b) {
  return Card(
    color: Styles.cardColor,
    child: Column(
      children: [
        InkWell(
          onTap: () => Get.to(ProductDetailsPage(product: b)),
          child: CachedNetworkImage(
            imageUrl: b.img[0],
            fit: BoxFit.cover,
            placeholder: (context, url) => Loading.cubegrid(),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                b.name,
                style: Styles.bodyText2,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        Container(
          height: 35,
          color: Styles.primaryColor,
          child: Center(
            child: Text(
              MyGlobals.moneyFormater(b.price),
              style: Styles.headlineText4,
            ),
          ),
        ),
        // MyWidgets.raisedButton(title: "Price", onPressed: () {}),
      ],
    ),
  );
}
