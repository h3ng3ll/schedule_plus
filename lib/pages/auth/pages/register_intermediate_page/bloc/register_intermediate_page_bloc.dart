import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../data/repositories/department_repository.dart';
import '../../../../../data/repositories/group_repository.dart';
import '../../../../../model/department/department.dart';
import '../../../../../model/group/group.dart';

part 'register_intermediate_page_event.dart';

part 'register_intermediate_page_state.dart';

part 'register_intermediate_page_bloc.freezed.dart';

class RegisterIntermediatePageBloc
    extends Bloc<RegisterIntermediatePageEvent, RegisterIntermediatePageState> {
  final GroupRepository _groupRepository = GroupRepository.instance;
  final DepartmentRepository _departmentRepository =
      DepartmentRepository.instance;

  RegisterIntermediatePageBloc()
      : super(const RegisterIntermediatePageState()) {
    on<_FetchGroups>(_fetchGroups);
    on<_FetchDepartments>(_fetchDepartments);

  }

  Future<void> _fetchGroups(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: RegisterIntermediatePageStatus.loading,
        ),
      );

      final groups = await _groupRepository.fetchGroups();
      emit(
        state.copyWith(
          status: RegisterIntermediatePageStatus.initial,
          groups: groups,
        ),
      );
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: RegisterIntermediatePageStatus.error,
          errorMessage: e.error?.toString() ?? '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterIntermediatePageStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _fetchDepartments(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: RegisterIntermediatePageStatus.loading,
        ),
      );

      final departments = await _departmentRepository.fetchDepartments();

      emit(
        state.copyWith(
          status: RegisterIntermediatePageStatus.initial,
          departments: departments,
        ),
      );
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: RegisterIntermediatePageStatus.error,
          errorMessage: e.error?.toString() ?? '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterIntermediatePageStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

}
