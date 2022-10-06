part of 'home.dart';

List<Widget> getHomeWidgetsList(BuildContext context) => [
      SliderWidget(ref: MyGlobals.homeBannerCollection),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: FutureBuilder<List<Blog>>(
          future: BlogsDb.getAllBrands(),
          builder: (BuildContext context, AsyncSnapshot<List<Blog>> snapshot) {
            if (!snapshot.hasData) {
              return Loading.spinKitThreeBounce();
            } else if (snapshot.data!.isEmpty) {
              return Container();
            } else {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Blog nn = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: ListTile(
                      tileColor: Styles.cardColor,
                      onTap: () => Get.to(MdDisplay(
                        content: nn.content,
                        title: "",
                        onBookmarkTap: () {},
                      )),
                      leading: SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                            imageUrl: nn.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                Container(color: Styles.primaryColor),
                            errorWidget: (context, url, error) => Container(),
                          ),
                        ),
                      ),
                      title: Text(
                        nn.title,
                        style: Styles.headlineText2,
                      ),
                      subtitle: Text(
                        nn.title,
                        style: Styles.bodyText2,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    ];
