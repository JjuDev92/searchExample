import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/search_images.dart';

class ImagesRepository {
  // 데이터 가져오는 부분 처리할 것

  Future<List<SearchImages>> fetch(String _keyword) async {
    // 데이터 가져오는 부분
    List<SearchImages> searhImages = [];

    var url = 'https://dapi.kakao.com/v2/search/image?query=$_keyword';

    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK 4408b3d5bd69e300cde744747abd8c40"});

    if (response.statusCode == 200) {
      final jsonResult = jsonDecode(response.body);
      final jsonSearchImages = jsonResult['documents'];

      jsonSearchImages?.forEach((e) {
        SearchImages searchImage = SearchImages.fromJson(e);
        searhImages.add(searchImage);
      });
    } else {
      // print('검색어를 찾을 수 없습니다.');
    }

    return searhImages;
  }
}
