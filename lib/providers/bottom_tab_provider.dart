import 'package:flutter/material.dart';

// 하단 탭바 이동 프로바이더

class BottomTabProvider extends ChangeNotifier {
  int _tabId = 0;

  int get tabId => _tabId;

  set tabId(int index) {
    _tabId = index;
    notifyListeners();
  }

  BottomTabProvider();
}
