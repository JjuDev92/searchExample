import 'package:flutter/material.dart';
import 'package:searchExample/screens/widget/loading_widget.dart';
import 'package:searchExample/viewmodel/search_image_model.dart';
import 'package:provider/provider.dart';
import '../widget/empty_widget.dart';
import 'page1_result_list.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  static const _appbarHeight = 48.0;
  final _textEditingController = TextEditingController();
  late SearchImagesModel _searchImagesModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _searchImagesModel = Provider.of<SearchImagesModel>(context);
    // var _searchImages = _searchImagesModel.getPostList();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Browser',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          foregroundColor: Colors.black54,
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
          toolbarHeight: _appbarHeight,
        ),
        body: Stack(children: [
          Container(
            color: Colors.white54,
            // margin: EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: TextField(
              cursorColor: Colors.lightBlueAccent,
              controller: _textEditingController,
              onSubmitted: searchText,
              onChanged: onKeyInput,
              decoration: const InputDecoration(
                hintText: '엔터를 눌러야 검색됩니다.',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
              ),
            ),
            height: 48,
          ),
          // 데이터 받아오는 중
          _searchImagesModel.isLoading
              ? loadingWidget()
              : Container(
                  padding: const EdgeInsets.only(top: 60),
                  child: _searchImagesModel.data.isNotEmpty
                      ? ListView(
                          children: _searchImagesModel.data.map((e) {
                            return Page1ResultList(e);
                          }).toList(),
                        )
                      : emptyWidget(),
                )
        ]));
  }

  void searchText(String _input) {
    _searchImagesModel.fetch(_input);
  }

  void onKeyInput(String _input) {}
}
