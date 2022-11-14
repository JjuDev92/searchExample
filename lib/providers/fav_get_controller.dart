import 'package:get/get.dart';
import '../repository/shared_repository.dart';

class FavController extends GetxController {
  final _sharedRepository = SharedRepository();

  void getPref() async {
    _sharedRepository.getAllPref;
  }

  void favClicked(String imageUrl) async {
    if (!await isInFav(imageUrl)) {
      _sharedRepository.savePref(imageUrl, true);
      update();
      return;
    }
    bool _boolFav = false;
    _boolFav = await _sharedRepository.getPref(imageUrl);
    if (_boolFav) {
      _sharedRepository.remvPref(imageUrl);
    } else {
      _sharedRepository.savePref(imageUrl, _boolFav);
    }
    update();
  }

  Future<bool> isInFav(String imageUrl) async {
    bool _result = await _sharedRepository.getPref(imageUrl);
    return _result;
  }

  Future<Set<String>> getFavLists() async {
    return await _sharedRepository.getFavLists();
    // return _result;
  }
}
