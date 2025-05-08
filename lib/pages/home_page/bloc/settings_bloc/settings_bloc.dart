import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/repositories/notification_repository.dart';
import '../../../../model/user/user.dart';
import '../../../../services/firebase/firebase_messaging_service.dart';

part 'settings_event.dart';

part 'settings_state.dart';

part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final FirebaseMessagingService _firebaseMessagingService =
      FirebaseMessagingService.instance;

  final NotificationRepository _notificationRepository =
      NotificationRepository.instance;

  late final StreamSubscription<RemoteMessage> remoteMessageSubscription;

  SettingsBloc(User user)
      : super(
          SettingsState(
            user: user,
          ),
        ) {
    on<_Update>(update);
    on<_FetchUnReadMessagesCount>(fetchUnReadMessagesCount);
    on<_IncrementUnReadMessagesCount>(incrementUnReadMessagesCount);
    on<_UnReadLastMessages>(unReadLastMessages);

    /// if appear push increment messages count
    _firebaseMessagingService.remoteMessageStream.listen(
      (e) {
        add(
          SettingsEvent.incrementUnReadMessagesCount(),
        );
      },
    );
    add(
      SettingsEvent.fetchUnReadMessagesCount(),
    );
  }

  void update(event, emit) {}

  Future<void> fetchUnReadMessagesCount(event, emit) async {
    try {
      final counts = await _notificationRepository.unReadMessagesCount();

      emit(
        state.copyWith(
          unReadNotifications: counts,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SettingsStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> incrementUnReadMessagesCount(event, emit) async {
    try {
      emit(
        state.copyWith(
          unReadNotifications: state.unReadNotifications + 1,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SettingsStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> unReadLastMessages(event, emit) async {
    try {
      final int counts = event.counts;
      emit(
        state.copyWith(
          unReadNotifications: state.unReadNotifications - counts,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SettingsStatus.error,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await remoteMessageSubscription.cancel();
    return super.close();
  }
}
