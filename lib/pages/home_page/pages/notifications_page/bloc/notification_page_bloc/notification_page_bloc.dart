import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/repositories/notification_repository.dart';
import '../../../../../../model/notification_pagination_state/notification_pagination_state.dart';
import '../../../../bloc/settings_bloc/settings_bloc.dart';

part 'notification_page_event.dart';

part 'notification_page_state.dart';

part 'notification_page_bloc.freezed.dart';

class NotificationPageBloc
    extends Bloc<NotificationPageEvent, NotificationPageState> {
  final NotificationRepository _notificationRepository =
      NotificationRepository.instance;

  final SettingsBloc _settingsBloc;

  NotificationPageBloc(
    this._settingsBloc,
  ) : super(NotificationPageState()) {
    on<_LoadNotifications>(loadNotifications);
    on<_MarkAsReadMessages>(markAsReadMessages);
    add(
      NotificationPageEvent.loadNotifications(),
    );
  }

  Future<void> loadNotifications(event, emit) async {
    try {
      if (state.paginationState.page >= state.paginationState.total) return;
      emit(
        state.copyWith(
          status: NotificationPageStatus.loading,
        ),
      );
      final newState = await _notificationRepository.fetchNotifications(
        state.paginationState.copyWith(
          page: state.paginationState.page + 1,
        ),
      );

      /// Mark notifications as 'read' if it is are fresh .
      final isReadNotifications = newState.notifications.map(
        (e) => e.isRead,
      );

      if (isReadNotifications.contains(false)) {
        add(
          NotificationPageEvent.markAsReadMessages(
            notificationIds: newState.notifications
                .where(
                  (e) => e.isRead == true,
                )
                .map(
                  (e) => e.id,
                )
                .toList(),
          ),
        );
      }
      emit(
        state.copyWith(
          paginationState: newState,
          status: NotificationPageStatus.loaded,
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

  Future<void> markAsReadMessages(event, emit) async {
    try {
      List<int> notificationIds = event.notificationIds;
      await _notificationRepository.markAsReadMessages(
        notificationIds,
      );
      _settingsBloc.add(
        SettingsEvent.unReadLastMessages(
          counts: notificationIds.length,
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
