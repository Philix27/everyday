import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/controller/article.dart';
import 'package:everyday/models/article_category.dart';
import 'package:everyday/view/article/find_article.dart';
import 'package:everyday/view/article/articles_collections.dart';
import 'package:everyday/view/widgets/loading.dart';

part 'a_count.dart';

class ArticlesDepartmentPage extends StatelessWidget {
  ArticlesDepartmentPage({Key? key, required this.title}) : super(key: key);
  final ScrollController controller = ScrollController();
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: FindArticle(),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ArticleDb().getSpecificCollections(title),
        builder: (BuildContext context,
            AsyncSnapshot<List<ArticlesCategory>> snapshot) {
          if (!snapshot.hasData) {
            print("** has no data ");
            return Loading.spinKitFadingCircle();
          }
          print("Length of data: ${snapshot.data!.length}");
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListTile(
                        onTap: () => pushNewScreen(
                          context,
                          screen: ArticleCollections(
                            sectionTitle: snapshot.data![index].name,
                            imgUrl: snapshot.data![index].imgUrl,
                          ),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        ),
                        tileColor: Styles.canvasColor,
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data![index].imgUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const Icon(Icons.timer),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        title: Text(
                          snapshot.data![index].name.toUpperCase(),
                          style: Styles.headlineText2,
                        ),
                        subtitle: articles_count(title),
                      ),
                    ),
                    Divider(
                      color: Styles.backgroundColor,
                      height: 2,
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
