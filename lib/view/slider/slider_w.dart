import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/slider_m.dart';
import 'package:everyday/view/widgets/loading.dart';
import 'package:everyday/view/widgets/widgets.dart';

part 'all_notifications.dart';
part 'add_slider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key, required this.ref}) : super(key: key);
  final CollectionReference ref;
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: widget.ref.snapshots(),
      // stream: MyGlobals.homeBannerCollection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Loading.spinKitThreeBounce();
        } else if (snapshot.data!.docs.isEmpty) {
          return Container();
        } else {
          return CarouselSlider.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index, int u) {
              final DocumentSnapshot postDoc = snapshot.data!.docs[index];

              final SliderModel slide =
                  SliderModel.fromMap(postDoc.data() as Map<String, dynamic>);
              if (slide.isImage) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: CachedNetworkImage(
                      imageUrl: slide.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: Loading.spinKitThreeBounce()),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: slide.colorCode,
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slide.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.headlineText3!.copyWith(fontSize: 13),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            slide.details,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.headlineText4!.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
            options: CarouselOptions(
              height: 120,
              viewportFraction: 0.9,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 7),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.easeInOut,
              enlargeCenterPage: true,
            ),
          );
        }
      },
    );
  }
}
