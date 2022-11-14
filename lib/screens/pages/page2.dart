import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchExample/viewmodel/search_image_model.dart';
import 'package:provider/provider.dart';
import '../../assets/assets.dart';
import '../../providers/fav_get_controller.dart';
import '../widget/no_result.dart';
import '../common/webview.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  static const _appbarHeight = 48.0;
  late SearchImagesModel _searchImagesModel;
  // final SearchImages _searchImages;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _searchImagesModel = Provider.of<SearchImagesModel>(context);
    // var _searchImages = _searchImagesModel.getPostList();
    Get.put(FavController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite List',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        foregroundColor: Colors.black54,
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        toolbarHeight: _appbarHeight,
      ),
      body: GetBuilder<FavController>(builder: (controller) {
        return FutureBuilder(
            future: controller.getFavLists(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData || snapshot.data.length < 1) {
                return noResultWidget();
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/webview',
                          arguments: WebViewArgs(
                            imageUrl: snapshot.data.elementAt(index),
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.blueGrey, blurRadius: 8.0)
                            ],
                            border: Border(
                              top: BorderSide(
                                color: Colors.black26,
                                width: 4.0,
                              ),
                            ),
                          ),
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: SizedBox(
                                    width: 32.0,
                                    height: 32.0,
                                    child: Container(
                                      margin: const EdgeInsets.all(6.0),
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                        Assets.favIconActive,
                                      ),
                                    ),
                                  ),
                                  onTap: () => controller.favClicked(
                                      snapshot.data.elementAt(index)),
                                ),
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
                                      width: 80,
                                      image: NetworkImage(
                                          snapshot.data.elementAt(index)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 18.0,
                                ),
                                SizedBox(
                                  width: 210,
                                  child: Text(
                                    snapshot.data.elementAt(index),
                                    maxLines: 4,
                                    softWrap: true,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 14.0,
                                      decoration: TextDecoration.none,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
            });
      }),
    );
  }
}
