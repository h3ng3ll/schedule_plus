import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../data/repositories/student_repository.dart';
import '../../../../../../model/group/group.dart';
import '../../../../../../model/user/user.dart';
import '../../../../bloc/settings_bloc/settings_bloc.dart';

part 'profile_tab_event.dart';

part 'profile_tab_state.dart';

part 'profile_tab_bloc.freezed.dart';

class ProfileTabBloc extends Bloc<ProfileTabEvent, ProfileTabState> {
  final SettingsBloc _settingsBloc;
  final StudentRepository _studentRepository = StudentRepository.instance;

  late final StreamSubscription<SettingsState> _settingsBlocSubscription;

  ProfileTabBloc(
    this._settingsBloc,
  ) : super(
          ProfileTabState(
            user: _settingsBloc.state.user,
          ),
        ) {
    on<_Load>(load);
    // add(
    //   ProfileTabEvent.load(),
    // );
    _settingsBlocSubscription = _settingsBloc.stream.listen(
      (state) {
        state.user;
      },
    );
  }

  Future<void> load(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: ProfileTabStatus.loading,
        ),
      );
      final group = await _studentRepository.fetchGroup();
      // emit(
      //   state.copyWith(
      //     // user: ,
      //     // name: "Alex",
      //     // surname: "Jognson",
      //     // department: "Computer Science",
      //     // year: 3,
      //     // avatarUrl:
      //     //     "https://i.pinimg.com/736x/3c/82/00/3c8200d43cca618675f4f776e3865680.jpg",
      //     status: ProfileTabStatus.loaded,
      //   ),
      // );
      emit(
        state.copyWith(
          group: group,
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

  @override
  Future<void> close() async {
    await _settingsBlocSubscription.cancel();
    return super.close();
  }
}
