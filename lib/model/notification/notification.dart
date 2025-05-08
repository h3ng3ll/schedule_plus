//
//
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../utils/json_serializable/json_serializable.dart';

part 'notification.freezed.dart';

part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required int id,
    required String title,
    required String body,
   @DateTimeSerializable() required DateTime createdAt,
    required bool isRead,
    String?  assignedLocation,
  }) = _Notification;

  factory Notification.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$NotificationFromJson(json);
}
