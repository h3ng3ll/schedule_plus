import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_tab_event.dart';

part 'profile_tab_state.dart';

part 'profile_tab_bloc.freezed.dart';

class ProfileTabBloc extends Bloc<ProfileTabEvent, ProfileTabState> {
  ProfileTabBloc() : super(const ProfileTabState()) {
    on<ProfileTabEvent>(
      (event, emit) {
        return event.map<FutureOr<void>>(
          load: (_) => load(event, emit),
        );
      },
    );
    add(
      ProfileTabEvent.load(),
    );
  }

  Future<void> load(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: ProfileTabStatus.loading,
        ),
      );

      emit(
        state.copyWith(
          name: "Alex",
          surname:  "Jognson",
          department:  "Computer Science",
          year: 3,
          avatarUrl:
              "https://i.pinimg.com/736x/3c/82/00/3c8200d43cca618675f4f776e3865680.jpg",
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
