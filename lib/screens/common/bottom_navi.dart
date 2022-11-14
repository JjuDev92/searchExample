import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../assets/assets.dart';
import '../../providers/bottom_tab_provider.dart';

class BottomBar extends StatefulWidget {
  final int selectedIndex = 0;

  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomBar> {
  int _currentTabIndex = 0;

  late BottomTabProvider _tabProvider;
  static const _iconHeight = 20.0;

  @override
  void initState() {
    super.initState();
    // build된 후 한번 호출. late 초기화 오류
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _currentTabIndex = _tabProvider.tabId;
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabProvider = Provider.of<BottomTabProvider>(context, listen: true);
    _currentTabIndex = _tabProvider.tabId;
    return _buildBottomNavigationBar(context);
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
      ),
      child: BottomNavigationBar(
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        onTap: _onTapSelected,
        selectedItemColor: Colors.cyanAccent,
        selectedFontSize: 10,
        selectedLabelStyle:
            const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        selectedIconTheme: const IconThemeData(size: 28),
        unselectedItemColor: Colors.black,
        unselectedFontSize: 10,
        unselectedLabelStyle:
            const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        unselectedIconTheme: const IconThemeData(size: 28),
        currentIndex: _currentTabIndex,
        backgroundColor: Colors.teal,
        //backgroundColor: _provider.loginState ? Colors.amber : Colors.green,
        iconSize: 28,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: _buildTabBarItems(),
      ),
    );
  }

  void _onTapSelected(int index) {
    _tabProvider.tabId = index;
  }

  List<BottomNavigationBarItem> _buildTabBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Container(
          height: _iconHeight,
          margin: const EdgeInsets.only(bottom: 2),
          child: Image.asset(Assets.homeIcon),
        ),
        activeIcon: Container(
          height: _iconHeight,
          margin: const EdgeInsets.only(bottom: 2),
          child: Image.asset(Assets.homeIconActive),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Container(
          height: _iconHeight,
          margin: const EdgeInsets.only(bottom: 2),
          child: Image.asset(Assets.favIcon),
        ),
        activeIcon: Container(
          height: _iconHeight,
          margin: const EdgeInsets.only(bottom: 2),
          child: Image.asset(Assets.favIconActive),
        ),
        label: 'Favorite',
      ),
    ];
  }
}
