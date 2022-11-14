import 'package:flutter/material.dart';
import 'package:searchExample/screens/common/content_page.dart';
import 'bottom_navi.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //appBar : AppBar(title: Text('Sample'),),
      body: ContentPage(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
