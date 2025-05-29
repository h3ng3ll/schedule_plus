import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/app_background.dart';
import 'bloc/notification_page_bloc/notification_page_bloc.dart';
import 'widget/app_bar/notifications_app_bar.dart';
import 'widget/notification_tile.dart';

class NotificationsPageArgs {
  final NotificationPageBloc notificationPageBloc;

  NotificationsPageArgs({
    required this.notificationPageBloc,
  });
}

class NotificationsPage extends StatelessWidget {
  final NotificationsPageArgs notificationsPageArgs;

  const NotificationsPage({
    super.key,
    required this.notificationsPageArgs,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: notificationsPageArgs.notificationPageBloc
        ..add(
          NotificationPageEvent.loadNotifications(),
        )
        ..add(
          NotificationPageEvent.markAsReadMessages(),
        ),
      child: Scaffold(
        appBar: NotificationAppBar(),
        body: AppBackground(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: BlocBuilder<NotificationPageBloc, NotificationPageState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.paginationState.notifications.length,
                    itemBuilder: (context, index) {
                      final notification =
                          state.paginationState.notifications[index];
                      return NotificationTile(
                        notification: notification,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
