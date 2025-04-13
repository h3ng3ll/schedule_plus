//
//
import 'package:freezed_annotation/freezed_annotation.dart';

part 'android_notification_channel_dto.freezed.dart';

part 'android_notification_channel_dto.g.dart';

@freezed
class AndroidNotificationChannelDTO with _$AndroidNotificationChannelDTO {
  const factory AndroidNotificationChannelDTO({
    required String id,
    required String name,
  }) = _AndroidNotificationChannelDTO;

  factory AndroidNotificationChannelDTO.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AndroidNotificationChannelDTOFromJson(json);
}
