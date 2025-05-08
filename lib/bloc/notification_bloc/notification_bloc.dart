import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repositories/notification_repository.dart';
import '../../services/firebase/firebase_messaging_service.dart';
import '../../services/notification_service/notification_service.dart';

part 'notification_event.dart';

part 'notification_state.dart';

part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _notificationRepository =
      NotificationRepository.instance;
  final NotificationService _notificationService = NotificationService.instance;
  final FirebaseMessagingService _firebaseMessagingService =
      FirebaseMessagingService.instance;

  NotificationBloc() : super(const NotificationState()) {
    on<_SaveToken>(saveToken);
  }

  Future<void> saveToken(event, emit) async {
    final String? token = _firebaseMessagingService.deviceToken;
    if (kDebugMode) {
      print(token);
    }
    if(token != null) {
      await _notificationRepository.registerUserToken(
        token,
      );
    }

  }
}
