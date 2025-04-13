import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../routes/init_router.dart';
import 'tabs/profile_tab/profile_tab.dart';
import 'tabs/schedule_tab/schedule_tab.dart';

class HomePage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomePage({super.key, required this.navigationShell});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final recordAnAudioKey = const Key('recordAnAudioKey');

  List<Widget> tabs = [ScheduleTab(), ProfileTab()];

  List<Icon> activeIcons = [
    Icon(
      Icons.view_agenda,
    ),
    Icon(
      Icons.person,
    ),
  ];
  List<Icon> inActiveIcons = [
    Icon(
      Icons.view_agenda,
    ),
    Icon(
      Icons.person,
    ),
  ];

  List<String> tabTitles(BuildContext context) {
    return [
      'Расписания',
      'Профиль ',
      'Аудиозаписи',
      'Курсы',
    ];
  }

  List<PersistentBottomNavBarItem> itemImages(BuildContext context) {
    List<PersistentBottomNavBarItem> barItems = [];
    for (int i = 0; i < activeIcons.length; i++) {
      final item = PersistentBottomNavBarItem(
        inactiveIcon: inActiveIcons[i],
        title: tabTitles(context)[i],
        icon: activeIcons[i],
      );
      barItems.add(item);
    }
    return barItems;
  }

  /// ruling tabs position
  void onItemSelected(int index, BuildContext context) {}

  @override
  void dispose() {
    homeKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: tabs,
      items: itemImages(context),
      navBarStyle: NavBarStyle.style6,
    );
  }
}
