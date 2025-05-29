import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../../routes/init_router.dart';
import '../../../resources/colors/app_color_scheme.dart';
import '../pages/notifications_page/bloc/notification_page_bloc/notification_page_bloc.dart';
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
      'Schedules',
      'Profile ',
      'AudioRecords',
      'Courses',
    ];
  }

  List<PersistentBottomNavBarItem> itemImages(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    List<PersistentBottomNavBarItem> barItems = [];
    for (int i = 0; i < activeIcons.length; i++) {
      final item = PersistentBottomNavBarItem(
        inactiveIcon: inActiveIcons[i],
        title: tabTitles(context)[i],
        icon: activeIcons[i],
        activeColorPrimary: colorScheme.onSecondary,
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
    return BlocProvider(
      create: (_) => NotificationPageBloc()
        ..add(
          NotificationPageEvent.loadUnreadMessagesCount(),
        ),
      child: PersistentTabView(
        context,
        screens: tabs,
        items: itemImages(context),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}
