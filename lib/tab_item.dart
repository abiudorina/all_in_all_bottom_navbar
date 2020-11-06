import 'package:all_in_all_bottom_navbar/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabItem {
  // customize for each tab
  final String tabName;
  final IconData icon;
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  int _index = 0;
  Widget _page;

  TabItem({this.tabName, this.icon, @required Widget page}) {
    _page = page;
  }

  // set the index of this tab => used to check if this tab is active
  void setIndex(int index) {
    _index = index;
  }

  int getIndex() => _index;

  // adds a wrapper around the page widgets for visibility
// visibility widget removes unnecessary problems
// like interactivity and animations when the page is inactive
  Widget get page {
    return Visibility(
      // only paint this page when the currentTab is active
      visible: _index == AppState.currentTab,
      maintainState: true,
      child: Navigator(
        key: key,
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (_) => _page);
        },
      ),
    );
  }
}
