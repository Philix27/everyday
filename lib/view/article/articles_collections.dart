import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/controller/article.dart';
import 'package:everyday/models/article.dart';
import 'package:everyday/view/article/articlesContent.dart';
import 'package:everyday/view/widgets/loading.dart';

class ArticleCollections extends StatelessWidget {
  const ArticleCollections({
    Key? key,
    // required this.script,
    required this.imgUrl,
    required this.sectionTitle,
  }) : super(key: key);
  // final String script;
  final String imgUrl;
  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                sectionTitle,
                style: Styles.headlineText2!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: Styles.canvasColor,
              expandedHeight: MediaQuery.of(context).size.height * 0.25,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      child: CachedNetworkImage(
                        imageUrl: imgUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            Loading.spinKitThreeBounce(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
          ),
          child: FutureBuilder(
            future: ArticleDb().getSpecificNotesFromCollection(sectionTitle),
            builder:
                (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (!snapshot.hasData) return Loading.spinKitFadingCircle();
              if (snapshot.data!.isEmpty)
                return Center(
                  child: Text(
                    'No article',
                    style: Styles.bodyText2,
                  ),
                );
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildArticlesTile(context, snapshot.data![index]);
                  });
            },
          ),
        ),
      ),
    );
  }
}

Widget buildArticlesTile(BuildContext context, Article course) => Column(
      children: [
        ListTile(
          onTap: () {
            pushNewScreen(
              context,
              screen: ArticlesContent(course: course),
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
            // Get.to(
            //   () => ArticlesContent(course: course),
            // );
          },
          tileColor: Styles.canvasColor,
          title: Text(
            course.title,
            style: Styles.headlineText2,
          ),
        ),
        Divider(
          color: Styles.backgroundColor,
          height: 2,
        ),
      ],
    );
