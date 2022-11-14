import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets/assets.dart';
import '../../models/search_images.dart';
import '../../providers/fav_get_controller.dart';
import 'page1_detail.dart';
import '../widget/loading_widget.dart';

class Page1ResultList extends StatelessWidget {
  final SearchImages _searchImages;
  const Page1ResultList(this._searchImages, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavController());

    return Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/page1_detail',
                arguments: Page1DetailArgs(
                    dateTime: _searchImages.datetime,
                    imageUrl: _searchImages.image_url,
                    docUrl: _searchImages.doc_url,
                    collection: _searchImages.collection),
              );
            },
            child: ListTile(
                tileColor: Colors.white70,
                subtitle: Column(children: [
                  Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(197, 163, 163, 175),
                          )
                        ],
                        border: Border(
                          top: BorderSide(
                            color: Colors.black26,
                            width: 4.0,
                          ),
                        ),
                      ),
                      child: Row(children: [
                        GetBuilder<FavController>(builder: (controller) {
                          return FutureBuilder(
                              future:
                                  controller.isInFav(_searchImages.image_url),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (!snapshot.hasData) {
                                  return loadingWidget();
                                } else {
                                  return GestureDetector(
                                    child: SizedBox(
                                      width: 32.0,
                                      height: 32.0,
                                      child: Container(
                                        margin: const EdgeInsets.all(6.0),
                                        height: 20,
                                        width: 20,
                                        child: snapshot.data
                                            ? Image.asset(
                                                Assets.favIconActive,
                                              )
                                            : Image.asset(
                                                Assets.favIcon,
                                              ),
                                      ),
                                    ),
                                    onTap: () => controller
                                        .favClicked(_searchImages.image_url),
                                  );
                                }
                              });
                        }),
                        const SizedBox(
                          width: 8.0,
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image(
                              height: 80,
                              width: 80 /
                                  _searchImages.height.toDouble() *
                                  _searchImages.width.toDouble(),
                              image: NetworkImage(_searchImages.thumbnail_url),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _searchImages.image_url.toString(),
                                style: TextStyle(
                                  color: Colors.blue.withOpacity(0.8),
                                  fontSize: 12.0,
                                  decoration: TextDecoration.underline,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                '출처(display_repository): ' +
                                    _searchImages.display_sitename.toString(),
                                style: TextStyle(
                                  color: Colors.black87.withOpacity(0.8),
                                  fontSize: 12.0,
                                  decoration: TextDecoration.none,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ],
                          ),
                        )
                      ]))
                ]))));
  }
}
