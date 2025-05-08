import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../model/notification/notification.dart';

part 'notification_page_event.dart';

part 'notification_page_state.dart';

part 'notification_page_bloc.freezed.dart';

class NotificationPageBloc
    extends Bloc<NotificationPageEvent, NotificationPageState> {
  NotificationPageBloc() : super(NotificationPageState()) {
    on<NotificationPageEvent>(
      (event, emit) async {
        return await event.map<FutureOr<void>>(
          loadNotifications: (_) => loadNotifications(event, emit),
        );
      },
    );
    add(
      NotificationPageEvent.loadNotifications(),
    );
  }

  void loadNotifications(event, emit) {
    try {
      emit(
        state.copyWith(
          status: NotificationPageStatus.loading,
        ),
      );
      emit(
        state.copyWith(
          status: NotificationPageStatus.loaded,
          notifications: [
            Notification(
              title: 'Відмінено пару на 14:40',
              body: 'Для груп АА ИИ СС були змінені пари, викладач А.Петренко',
              time: DateTime.now(),
              isRead: false,
            ),
            Notification(
              title: 'Оновлено розклад',
              body: 'Для груп АА ИИ СС були змінені пари,',
              time: DateTime.now(),
              isRead: false,
            ),
          ],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: NotificationPageStatus.error,
        ),
      );
    }
  }
}
