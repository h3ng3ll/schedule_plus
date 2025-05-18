import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'professor.freezed.dart';

part 'professor.g.dart';

@freezed
class Professor with _$Professor {
  const factory Professor({
    required int id,
    required User user,
  }) = _Professor;

  factory Professor.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ProfessorFromJson(json);
}
