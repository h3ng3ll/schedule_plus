import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/repositories/student_repository.dart';
import '../../../../../../data/repositories/user_repository.dart';
import '../../../../../../model/group/group.dart';
import '../../../../../../model/user/user.dart';

part 'profile_tab_event.dart';

part 'profile_tab_state.dart';

part 'profile_tab_bloc.freezed.dart';

class ProfileTabBloc extends Bloc<ProfileTabEvent, ProfileTabState> {
  final StudentRepository _studentRepository = StudentRepository.instance;
  final UserRepository _userRepository = UserRepository.instance;

  ProfileTabBloc() : super(ProfileTabState()) {
    on<_Load>(load);
  }

  Future<void> load(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: ProfileTabStatus.loading,
        ),
      );
      final group = await _studentRepository.fetchGroup();

      final User user = await _userRepository.me();

      emit(
        state.copyWith(
          group: group,
          user: user,
          status: ProfileTabStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfileTabStatus.error,
        ),
      );
    }
  }

}
