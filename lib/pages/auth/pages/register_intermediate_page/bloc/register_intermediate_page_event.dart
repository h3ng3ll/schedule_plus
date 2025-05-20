part of 'register_intermediate_page_bloc.dart';

@freezed
class RegisterIntermediatePageEvent with _$RegisterIntermediatePageEvent {
  const factory RegisterIntermediatePageEvent.fetchGroups() = _FetchGroups;
  const factory RegisterIntermediatePageEvent.fetchDepartments() = _FetchDepartments;


}
