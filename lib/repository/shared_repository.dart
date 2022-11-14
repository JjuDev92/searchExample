import 'package:shared_preferences/shared_preferences.dart';

class SharedRepository {
  // 저장소에 url을 키로, 불린값 value로 저장
  Future<bool> savePref(String _imageUrl, bool _isFav) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(_imageUrl, _isFav);
  }

  // 저장소에서 url 제거
  Future<bool> remvPref(String _imageUrl) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_imageUrl);
  }

  // 저장소에서 해당 이미지 url에 대한 불린 값 가져옴
  Future<bool> getPref(String _imageUrl) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? _isFav = prefs.getBool(_imageUrl);

    _isFav ??= false;
    return _isFav;
  }

  Future<SharedPreferences> getAllPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs;
  }

  Future<Set<String>> getFavLists() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getKeys();
  }
}
