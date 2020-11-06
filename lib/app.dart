import 'package:all_in_all_bottom_navbar/bottom_navigation.dart';
import 'package:all_in_all_bottom_navbar/pages.dart';
import 'package:all_in_all_bottom_navbar/tab_item.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // an index of the current tab that can be accessed from anywhere
  static int currentTab = 0;

  // the list of the tabs in our app
  final List<TabItem> tabs = [
    TabItem(
      tabName: "Home",
      icon: Icons.home,
      page: HomeScreen(),
    ),
    TabItem(
      tabName: "Settings",
      icon: Icons.settings,
      page: SettingsScreen(),
    ),
  ];

  AppState() {
    // indexing to determine which tab is active
    tabs.asMap().forEach((int index, TabItem details) {
      details.setIndex(index);
    });
  }

  // set current tab index and update state
  void _selectTab(int index) {
    if (index == currentTab) {
      // pop to first route if the user taps on the active tab
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      // update state in order to repaint
      setState(() {
        currentTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // willpopscope handles the android back button
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();

        if (isFirstRouteInCurrentTab) {
          // if we are not on the main tab
          if (currentTab != 0) {
            _selectTab(0);
          }

          // handled by app
          return false;
        }

        return isFirstRouteInCurrentTab;
      },

      // this is the base scaffold
      // don't put appbar in here otherwise you might end up
      // with multiple appbars on one screen
      // eventually breaking the app
      child: Scaffold(
        // indexed stack shows only one child
        body: IndexedStack(
          index: currentTab,
          children: tabs.map((TabItem tabItem) => tabItem.page).toList(),
        ),
        bottomNavigationBar:
            BottomNavigation(onSelectTab: _selectTab, tabs: tabs),
        extendBody: true,
      ),
    );
  }
}
