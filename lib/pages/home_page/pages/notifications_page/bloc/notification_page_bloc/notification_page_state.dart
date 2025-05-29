part of 'notification_page_bloc.dart';

enum NotificationPageStatus {
  initial,
  loading,
  loaded,
  error,
}

@freezed
class NotificationPageState with _$NotificationPageState {
  const factory NotificationPageState({
    @Default(NotificationPageStatus.initial) NotificationPageStatus status,
    @Default(NotificationPaginationState()) NotificationPaginationState paginationState,
    @Default(0) int unreadMessagesCount ,
    @Default('') errorMessage,
  }) = _NotificationPageState;
}
