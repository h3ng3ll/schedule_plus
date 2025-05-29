import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../model/notification_pagination_state/notification_pagination_state.dart';
import '../../../../../../services/notification_service/notification_service.dart';

part 'notification_page_event.dart';

part 'notification_page_state.dart';

part 'notification_page_bloc.freezed.dart';

class NotificationPageBloc
    extends Bloc<NotificationPageEvent, NotificationPageState> {
  final NotificationService _notificationService = NotificationService.instance;

  late final StreamSubscription<int> _unreadMessageCountSubscription;
  late final StreamSubscription<NotificationPaginationState>
      _notificationPaginationStateSubscription;

  NotificationPageBloc() : super(NotificationPageState()) {
    on<_LoadNotifications>(loadNotifications);
    on<_MarkAsReadMessages>(markAsReadMessages);
    on<_LoadUnreadMessagesCount>(loadUnreadMessagesCount);
    on<_UpdateMessages>(updateMessages);
    on<_UpdateUnreadMessageCount>(updateUnreadMessageCount);

    _notificationPaginationStateSubscription =
        _notificationService.notificationsStream.listen(
      (newNotificationPgState) => add(
        NotificationPageEvent.updateMessages(
          notificationPgState: newNotificationPgState,
        ),
      ),
    );
    _unreadMessageCountSubscription =
        _notificationService.unreadMessagesCountStream.listen(
      (count) => add(
        NotificationPageEvent.updateUnreadMessageCount(
          unreadMessageCount: count,
        ),
      ),
    );
  }

  void updateMessages(event, emit) {
    final NotificationPaginationState notificationPgState =
        event.notificationPgState;
    emit(
      state.copyWith(
        paginationState: notificationPgState,
      ),
    );
  }

  void updateUnreadMessageCount(event, emit) {
    final int unreadMessageCount = event.unreadMessageCount;
    emit(
      state.copyWith(
        unreadMessagesCount: unreadMessageCount,
      ),
    );
  }

  Future<void> loadNotifications(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: NotificationPageStatus.loading,
        ),
      );
      await _notificationService.fetchNotifications();

      emit(
        state.copyWith(
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
      emit(
        state.copyWith(
          status: NotificationPageStatus.loading,
        ),
      );

      final isReadNotifications = state.paginationState.notifications
          .map(
            (e) => e.isRead,
          )
          .contains(
            false,
          );

      if (isReadNotifications) {
        final unReadNotificationIds = state.paginationState.notifications
            .where(
              (e) => e.isRead == false,
            )
            .map(
              (e) => e.id,
            )
            .toList();
        await _notificationService.markAsReadMessages(
          unReadNotificationIds,
        );

        /// remove
        // final notification = List<Notification>.from(
        //   state.paginationState.notifications,
        // );
        // final notificationIds = notification.map((e) => e.id).toList();
        //
        // for (int notificationId in notificationIds) {
        //   final index = unReadNotificationIds.indexOf(
        //     notificationId,
        //   );
        //   notification[index] = notification[index].copyWith(
        //     isRead: true,
        //   );
        // }
        //
        // emit(
        //   state.copyWith(
        //     paginationState: state.paginationState.copyWith(
        //       notifications: notification,
        //     ),
        //     unreadMessagesCount:
        //         state.unreadMessagesCount - unReadNotificationIds.length,
        //     status: NotificationPageStatus.loaded,
        //   ),
        // );
      }

      emit(
        state.copyWith(
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

  Future<void> loadUnreadMessagesCount(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: NotificationPageStatus.loaded,
        ),
      );
      await _notificationService.loadUnreadMessagesCount();

      emit(
        state.copyWith(
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

  @override
  Future<void> close() {
    _notificationPaginationStateSubscription.cancel();
    _unreadMessageCountSubscription.cancel();
    return super.close();
  }
}
