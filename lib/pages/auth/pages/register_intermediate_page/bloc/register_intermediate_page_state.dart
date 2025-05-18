part of 'register_intermediate_page_bloc.dart';

enum RegisterIntermediatePageStatus {
  initial,
  loading,
  error,
}

@freezed
class RegisterIntermediatePageState with _$RegisterIntermediatePageState {
  const factory RegisterIntermediatePageState({
    @Default(RegisterIntermediatePageStatus.initial)
    RegisterIntermediatePageStatus status,
    @Default('') String errorMessage,
    @Default([]) List<Group> groups,
    @Default([]) List<Department> departments,

    Group? group,
    Department? department,
    String? name,
  }) = _RegisterIntermediatePageState;
}
