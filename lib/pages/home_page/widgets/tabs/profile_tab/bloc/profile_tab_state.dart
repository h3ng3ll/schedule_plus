part of 'profile_tab_bloc.dart';

enum ProfileTabStatus{
  initial,
  loading,
  loaded,
  error,
}
@freezed
class ProfileTabState with _$ProfileTabState {
  const factory ProfileTabState({
    @Default(ProfileTabStatus.initial) ProfileTabStatus status,
    String? avatarUrl,
    String? name,
    String? surname,
    String? department,
    int? year,
}) = _ProfileTabState;
}
