import 'package:flutter/material.dart';
import 'package:everyday/models/product.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:everyday/view/widgets/loading.dart';

import 'package:get/route_manager.dart';
import 'package:everyday/core/global_variables.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(product.name, style: Styles.headlineText1),
// automaticallyImplyLeading: false,
              backgroundColor: Styles.canvasColor,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: product.img[0],
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Loading.spinKitThreeBounce(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          color: Styles.canvasColor,
          width: MediaQuery.of(context).size.width,
          height: 300,
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10,
          ),
          child: ListView(
            children: [],
          ),
        ),
      ),
    );
  }
}
