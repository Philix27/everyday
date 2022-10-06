import 'package:cached_network_image/cached_network_image.dart';
import 'package:everyday/view/home/product_details.dart';
import 'package:everyday/view/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:everyday/controller/products.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/product.dart';
import 'package:everyday/view/cart/drugInfo.dart';
import 'package:everyday/view/home/search.dart';
import 'package:everyday/view/widgets/loading.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Cart",
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
        future: ProductsDb.getAllBrands(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
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
                    Product b = snapshot.data![index];
                    return buildDrugTile(context, b);
                  }),
            );
          }
        },
      ),
    );
  }
}

Widget buildDrugTile(BuildContext context, Product b) => Column(
      children: [
        ListTile(
          onTap: () {
            MyWidgets.goTo(ProductDetailsPage(product: b));
          },
          tileColor: Styles.cardColor,
          leading: SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: b.img[0].isEmpty ? "" : b.img[0],
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Container(color: Styles.primaryColor),
                errorWidget: (context, url, error) => Container(),
              ),
            ),
          ),
          title: Text(
            b.name,
            style: Styles.headlineText2,
          ),
          subtitle: Text(
            b.category,
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
