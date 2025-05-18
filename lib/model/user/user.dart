import 'package:freezed_annotation/freezed_annotation.dart';

import '../department/department.dart';

part 'user.freezed.dart';

part 'user.g.dart';


@freezed
class User with _$User {
  const factory User({
    required String name,
    required String email,
    String? imgUrl,
    String? surname,
    required Department department,
  }) = _User;

  factory User.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$UserFromJson(json);
}
