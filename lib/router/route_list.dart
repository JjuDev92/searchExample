import 'package:flutter/material.dart';

import '../screens/common/main_page.dart';
import '../screens/pages/page1_detail.dart';
import '../screens/common/splash_screen.dart';
import '../screens/common/webview.dart';

final routes = {
  '/': (BuildContext context) => const SplashScreen(),
  '/main': (BuildContext context) => const MainPage(),
  '/page1_detail': (BuildContext context) => const Page1Detail(),
  '/webview': (BuildContext context) => const Webview(),
};
