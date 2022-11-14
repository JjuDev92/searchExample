import 'package:flutter/material.dart';
import 'package:searchExample/screens/pages/page1.dart';
import 'package:provider/provider.dart';
import '../../providers/bottom_tab_provider.dart';
import '../pages/page2.dart';

class ContentPage extends StatefulWidget {
  final int selectedIndex = 0;

  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  final List<Widget> _widgetOptions = [
    const Page1(),
    const Page2(),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // FavController().getPref();
    });
  }

  @override
  Widget build(BuildContext context) {
    BottomTabProvider _tabProvider =
        Provider.of<BottomTabProvider>(context, listen: true);
    return IndexedStack(
      index: _tabProvider.tabId,
      children: _widgetOptions,
    );
  }
}
