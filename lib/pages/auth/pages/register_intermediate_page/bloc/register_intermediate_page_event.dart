part of 'register_intermediate_page_bloc.dart';

@freezed
class RegisterIntermediatePageEvent with _$RegisterIntermediatePageEvent {
  const factory RegisterIntermediatePageEvent.fetchGroups() = _FetchGroups;
  const factory RegisterIntermediatePageEvent.fetchDepartments() = _FetchDepartments;

  const factory RegisterIntermediatePageEvent.updateData({
    // required String email,
    // required String password,
    String? name,
    Group? group,
    Department? department,
    // required VoidCallback onCompleted,
  }) = _UpdateData;

}
