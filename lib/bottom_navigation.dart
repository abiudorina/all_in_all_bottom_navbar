import 'package:all_in_all_bottom_navbar/app.dart';
import 'package:all_in_all_bottom_navbar/tab_item.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  const BottomNavigation({Key key, this.onSelectTab, this.tabs})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: tabs
          .map((TabItem tabItem) => _buildItem(
                tabName: tabItem.tabName,
                icon: tabItem.icon,
                index: tabItem.getIndex(),
              ))
          .toList(),
      onTap: (value) {
        onSelectTab(value);
      },
    );
  }

  BottomNavigationBarItem _buildItem(
      {@required int index,
      @required IconData icon,
      @required String tabName}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _tabColor(index: index),
      ),
      title: Text(
        tabName,
        style: TextStyle(color: _tabColor(index: index), fontSize: 12),
      ),
    );
  }

  Color _tabColor({int index}) {
    return AppState.currentTab == index ? Colors.cyan : Colors.grey;
  }
}
