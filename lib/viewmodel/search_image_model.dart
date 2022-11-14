import 'package:flutter/foundation.dart';

import '../../repository/image_repository.dart';
import '../models/search_images.dart';

class SearchImagesModel with ChangeNotifier {
  final _searchRepository = ImagesRepository();

  List<SearchImages> data = [];
  var isLoading = false;

  SearchImagesModel(_searchKeyword) {
    // fetch(_searchKeyword);
  }

  Future fetch(String _keyword) async {
    isLoading = true;
    notifyListeners();
    data = await _searchRepository.fetch(_keyword);
    isLoading = false;
    notifyListeners();
  }
}
